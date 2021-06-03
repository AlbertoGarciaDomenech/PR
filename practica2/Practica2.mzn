%Practica 2 asignatura PR: Alberto García Doménech & David Godoy Ruiz

int:VALOR;                                                     %valor producto final (despues de refinar)
int:MAXV;                                                      %maximo en toneladas de aceites vegetales refinado
int:MAXN;                                                      %maximo en toneladas de aceites no vegetales refinado
int:MCAP;                                                      %capacidad almacenamiento para cada tipo de aceite
int:CA;                                                        %costes de almacenamiento
int:MinD;                                                      %minimo dureza de producto final
int:MaxD;                                                      %maximo dureza de producto final
int:MinB;                                                      %minimo beneficio

enum AceitesVeg = {VEG1, VEG2};                                %tipos de aceites vegetales
enum AceitesNoVeg = {ANV1, ANV2, ANV3};                        %tipo de aceites no vegetales
enum meses = {ENERO,FEBRERO,MARZO,ABRIL,MAYO,JUNIO};
array[1..6,AceitesVeg] of int: preciosVeg;                     %precio de compra de los aceites vegetales por mes
array[1..6,AceitesNoVeg] of int: preciosNoVeg;                 %precio de compra de los aceites no vegetales por mes
    
array[AceitesVeg] of float:durezaVeg;                          %dureza de aceites vegetales
array[AceitesNoVeg] of float:durezaNoVeg;                      %dureza aceites no vegetales

array[AceitesVeg] of int:cantidadVeg;                          %cantidad inicial y final de aceites vegetales
array[AceitesNoVeg] of int:cantidadNoVeg;                      %cantidad inicial y final de aceites no vegetales
  
array[1..6, AceitesVeg] of var 0..MAXV:refinVeg;               %aceite vegetal refinado cada mes (cota maxima de MAXV por mes)
array[1..6, AceitesNoVeg] of var 0..MAXN:refinNoVeg;           %aceite no vegetal refinado cada mes(cota maxima de MAXN por mes)
  
array[1..6,AceitesVeg] of var 0..MCAP:almacVeg;                %cantidad almacenada aceite vegetal al inicio del mes(cota maxima MCAP por mes)
array[1..6,AceitesNoVeg] of var 0..MCAP: almacNoVeg;           %cantidad almacenada aceite no vegetal por mes

array[1..6, AceitesVeg] of var 0..MCAP+MAXV:compVeg;           %compras de aceite vegetal por mes,cota maxima de almacenamiento + refinado(no se almacena)
array[1..6, AceitesNoVeg] of var 0..MCAP+MAXN:compNoVeg;       %compras de aceite no vegetal por mes


%ASSERTS
constraint assert ( VALOR > 0,"El valor del producto final tiene que ser positivo");
constraint assert ( MAXV > 0,"El maximo de aceite vegetal refinado tiene que ser positivo");
constraint assert ( MAXN > 0,"El maximo de aceite no vegetal refinado tiene que ser positivo");
constraint assert ( MCAP > 0, "La capacidad de almacenamiento maxima tiene que ser mayor que 0");
constraint assert(MinD < MaxD, "La dureza minima tiene que ser menor que la dureza maxima");
constraint assert((forall (i in AceitesVeg) (cantidadVeg[i] <= MCAP)) /\ (forall (i in AceitesNoVeg) (cantidadNoVeg[i] <= MCAP)), "La cantidad final de cada aceite no puede superar el limite de almacenamiento");

%RESTRICCIONES

%refinar maximo MAXV de aceites vegetales
constraint forall (mes in meses) ((sum (aceite in AceitesVeg) (refinVeg[mes,aceite]))<MAXV);
%refinar maximo MAXN de aceites vegetales
constraint forall (mes in meses) ((sum (aceite in AceitesNoVeg) (refinNoVeg[mes,aceite]))<MAXN);

%cada mes no podemos refinar mas aceite del que tenemos guardado en el almacen o hemos comprado
constraint forall (i in meses) (forall (aceite in AceitesVeg) (almacVeg[i,aceite] + compVeg[i,aceite] >= refinVeg[i,aceite]));
constraint forall (i in meses) (forall (aceite in AceitesNoVeg) (almacNoVeg[i,aceite] + compNoVeg[i,aceite] >= refinNoVeg[i,aceite]));

%la dureza final del producto (suma ponderada de la dureza de sus aceites componentes) tiene que estar entre minD y maxD
constraint forall (mes in meses) (sumaPonderada(mes)>MinD*refinMes(mes));
constraint forall (mes in meses) (sumaPonderada(mes)<MaxD*refinMes(mes));
  
%almacenamiento
%inicializar el almacenamiento en enero (para mayor beneficio lo inicializamos con la cantidad que nos dan por entrada y que tienen que tener al final)
constraint forall (aceite in AceitesVeg) (almacVeg[ENERO,aceite] = cantidadVeg[aceite]);
constraint forall (aceite in AceitesNoVeg) (almacNoVeg[ENERO,aceite] = cantidadNoVeg[aceite]);
%cada mes el almacenamiento equivale a la cantidad del mes anterior más las compras hechas el mes anterior menos la cantidad refinada ese mes.
constraint forall (mes in FEBRERO..JUNIO) (forall (aceite in AceitesVeg) (almacVeg[mes,aceite] = almacVeg[mes-1,aceite] + compVeg[mes-1,aceite] -refinVeg[mes-1,aceite]));
constraint forall (mes in FEBRERO..JUNIO) (forall (aceite in AceitesNoVeg) (almacNoVeg[mes,aceite] = almacNoVeg[mes-1,aceite] + compNoVeg[mes-1,aceite]-refinNoVeg[mes-1,aceite]));


%tenemos que tener una cantidad exacta de cada tipo de aceite al final de junio
%para calcular lo que tenemos al final de junio sumamos a lo que tenemos al inicio de junio mas las compras hechas ese mes y le restamos las toneladas refinadas
constraint forall (aceite in AceitesVeg) (almacVeg[JUNIO,aceite]+compVeg[JUNIO,aceite]-refinVeg[JUNIO,aceite] = cantidadVeg[aceite]); 
constraint forall (aceite in AceitesNoVeg) (almacNoVeg[JUNIO,aceite]+compNoVeg[JUNIO,aceite]-refinNoVeg[JUNIO,aceite] = cantidadNoVeg[aceite]);

%el almacenamiento no puede superar el limite de almacenamiento en ningun momento
constraint forall (mes in meses, aceite in AceitesVeg) (almacVeg[mes,aceite] <= MCAP);
constraint forall (mes in meses, aceite in AceitesNoVeg) (almacNoVeg[mes,aceite] <= MCAP);

%tenemos que tener un minimo de beneficio
constraint benef()>MinB;

%FUNCIONES

%funcion que calcula la suma ponderada aceiteRefinado(i)*durezaAceite(i)  de un mes
function var float:sumaPonderada(int:mes) = sum (veg in AceitesVeg) (refinVeg[mes,veg] * durezaVeg[veg]) + sum (noveg in AceitesNoVeg) (refinNoVeg[mes,noveg] * durezaNoVeg[noveg]); 
%funcion que calcula el total de producto vendido en un mes
function var int: refinMes(int:mes) = sum (aceite in AceitesVeg) (refinVeg[mes,aceite]) + sum (aceiteN in AceitesNoVeg) (refinNoVeg[mes,aceiteN]);


%funcion que calcula gastos totales en un mes determinado
function var int:gastos(int:mes) = gastosCompras(mes) + gastosAlmacenamiento(mes);
%funcion que calcula gastos en compras en un mes determinado
function var int:gastosCompras(int:mes)= (sum (aceite in AceitesVeg) (compVeg[mes,aceite]*preciosVeg[mes,aceite]) + sum (aceite in AceitesNoVeg) (compNoVeg[mes,aceite]*preciosNoVeg[mes,aceite]));
%funcion que calcula gastos en almacenamiento en un mes determinado
function var int:gastosAlmacenamiento(int:mes)=(sum(aceite in AceitesVeg) (almacVeg[mes,aceite]) + sum(aceite in AceitesNoVeg) (almacNoVeg[mes,aceite])) * CA;
function var int:benef()= sum (mes in meses) (refinMes(mes)*VALOR-(gastos(mes)));


%EXTENSIONES

%DECLARACIONES PARA EXTENSIONES
%int:K;
%int:T;

%no hacer el producto final con mas de K aceites
%constraint forall (i in meses) ((sum(aceite in AceitesVeg) (bool2int(refinVeg[i,aceite]>0)) + sum(aceite in AceitesNoVeg) (bool2int(refinNoVeg[i,aceite]>0)))<=K);
%si usamos un aceite un mes para hacer el producto final tenemos que usar como minimo T toneladas
%constraint forall (i in meses) ((forall (j in AceitesVeg) (refinVeg[i,j] = 0 \/ refinVeg[i,j] > T)) /\ (forall (k in AceitesNoVeg) (refinNoVeg[i,k]=0\/refinNoVeg[i,k]>T)));
%si se usa VEG1 o VEG2 entonces se tiene que usar ese mismo mes ANV3
%constraint forall(i in meses) ((refinVeg[i,VEG1]>0 \/ refinVeg[i,VEG1]>0)->refinNoVeg[i,ANV3]>0);

%EXTENSIONES POSIBLES
%el valor del producto final depende del valor de los aceites que lo conforman(puede ir variando dependiendo del mes)
%array [1..6, AceitesVeg] of int:ValorVEG;
%array [1..6, AceitesNoVeg] of int:ValorNoVEG;
%el beneficio se calcularia asi:
%function var int:benef2() = sum (mes in meses) ((sum (aceite in AceitesVeg) (refinVeg[mes,aceite]*ValorVEG[mes,aceite]))+(sum (aceite in AceitesNoVeg) (refinNoVeg[mes,aceite]*ValorNoVEG[mes,aceite])) -(gastos(mes)));
%si usamos un aceite X no podemos usar un aceite Y porque no se mezclan bien (por ejemplo el VEG2 y el ANV2)
%constraint forall(i in meses) ((refinVeg[i,VEG2]>0->refinNoVeg[i,ANV2]=0) \/ (refinNoVeg[i,ANV2]>0->refinVeg[i,VEG2]=0));
%si un mes refinamos mas de una cantidad Z de toneladas el siguiente mes no podremos refinar ese tipo de aceite
%int:Z;
%constraint forall (i in 1..5) ((forall (j in AceitesVeg) (refinVeg[i,j]>Z->refinVeg[i+1,j]=0)) /\ (forall (j in AceitesNoVeg) (refinNoVeg[i,j]>Z->refinNoVeg[i+1,j]=0)));

solve maximize benef();

output ["COMPRAS VEG:\n"] ++ [if (j == 1) then "\(i)" else "" endif ++ " \(compVeg[i, j])" ++ if (j==2) then "\n" else "" endif| i in meses, j in AceitesVeg] ++ ["\n"];
output ["COMPRAS NO VEG:\n"]  ++ [if (j == 1) then "\(i)" else ""endif ++ " \(compNoVeg[i, j])" ++ if (j==3) then "\n" else ""endif| i in meses, j in AceitesNoVeg] ++ ["\n"];
output ["REFINADOS VEG:\n"] ++ [if (j == 1) then "\(i)" else "" endif ++ " \(refinVeg[i, j])" ++ if (j==2) then "\n" else "" endif| i in meses, j in AceitesVeg] ++ ["\n"];
output ["REFINADOS NO VEG:\n"]  ++ [if (j == 1) then "\(i)" else ""endif ++ " \(refinNoVeg[i, j])" ++ if (j==3) then "\n" else ""endif| i in meses, j in AceitesNoVeg] ++ ["\n"];
output ["ALMACENAMIENTO VEG:\n"] ++ [if (j == 1) then "\(i)" else "" endif ++ " \(almacVeg[i, j])" ++ if (j==2) then "\n" else "" endif| i in meses, j in AceitesVeg] ++ ["\n"];
output ["ALMACENAMIENTO NO VEG:\n"]  ++ [if (j == 1) then "\(i)" else ""endif ++ " \(almacNoVeg[i, j])" ++ if (j==3) then "\n" else ""endif| i in meses, j in AceitesNoVeg] ++ ["\n"];
output ["ALMACENAMIENTO FINAL\n VEG: "] ++ ["\(almacVeg[JUNIO,aceite]+compVeg[JUNIO,aceite]-refinVeg[JUNIO,aceite]) " | aceite in AceitesVeg] ++ ["\n NO VEG: "] ++ ["\(almacNoVeg[JUNIO,aceite]+compNoVeg[JUNIO,aceite]-refinNoVeg[JUNIO,aceite]) "| aceite in AceitesNoVeg];
output ["\nBeneficio total: \n"] ++ ["\(sum (i in meses) (((sum (j in AceitesVeg) (refinVeg[i, j]*VALOR - (compVeg[i, j]*preciosVeg[i, j] + almacVeg[i, j]*CA))) + sum (j in AceitesNoVeg) (refinNoVeg[i, j]*VALOR - (compNoVeg[i, j]*preciosNoVeg[i, j] + almacNoVeg[i, j]*CA)))))"];