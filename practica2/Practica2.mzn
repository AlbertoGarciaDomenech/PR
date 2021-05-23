%Practica 2 asignatura PR: Alberto García Doménech & David Godoy Ruiz

int:VALOR;                                                    %valor producto final (despues de refinar)
int:MAXV;                                                     %maximo en toneladas de aceites vegetales refinado
int:MAXN;                                                     %maximo en toneladas de aceites no vegetales refinado
int:MCAP;                                                     %capacidad almacenamiento para cada tipo de aceite
int:CA;                                                       %costes de almacenamiento
int:MinD;                                                     %minimo dureza de producto final
int:MaxD;                                                     %maximo dureza de producto final
int:MinB;                                                     %minimo beneficio

enum AceitesVeg = {VEG1, VEG2};                               %tipos de aceites vegetales
enum AceitesNoVeg = {ANV1, ANV2, ANV3};                       %tipo de aceites no vegetales

array[1..6,AceitesVeg] of int: preciosVeg;                   %precio de compra de los aceites vegetales por mes
array[1..6,AceitesNoVeg] of int: preciosNoVeg;               %precio de compra de los aceites no vegetales por mes
    
array[AceitesVeg] of float:durezaVeg;                        %dureza de aceites vegetales
array[AceitesNoVeg] of float:durezaNoVeg;                    %dureza aceites no vegetales

array[AceitesVeg] of int:cantidadVeg;                        %cantidad inicial y final de aceites vegetales
array[AceitesNoVeg] of int:cantidadNoVeg;                    %cantidad inicial y final de aceites no vegetales

array[1..6, AceitesVeg] of var 0..MAXV:refinVeg;             %aceite vegetal refinado cada mes (cota maxima de MAXV por mes)
array[1..6, AceitesNoVeg] of var 0..MAXN:refinNoVeg;         %aceite no vegetal refinado cada mes(cota maxima de MAXN por mes)

array[1..6,AceitesVeg] of var 0..MCAP:almacVeg;              %cantidad almacenada aceite vegetal por mes(cota maxima MCAP por mes)
array[1..6,AceitesNoVeg] of var 0..MCAP: almacNoVeg;         %cantidad almacenada aceite no vegetal por mes

array[1..6, AceitesVeg] of var 0..MCAP+MAXV:compVeg;         %compras de aceite vegetal por mes,cota maxima de almacenamiento + refinado(no se almacena)
array[1..6, AceitesNoVeg] of var 0..MCAP+MAXN:compNoVeg;     %compras de aceite no vegetal por mes

%RESTRICCIONES

%refinar maximo MAXV de aceites vegetales
constraint forall (mes in 1..6) ((sum (aceite in AceitesVeg) (refinVeg[mes,aceite]))<MAXV);
%refinar maximo MAXN de aceites vegetales
constraint forall (mes in 1..6) ((sum (aceite in AceitesNoVeg) (refinNoVeg[mes,aceite]))<MAXN);

%la dureza final del producto (suma ponderada de la dureza de sus aceites componentes) tiene que estar entre minD y maxD
constraint forall (mes in 1..6) (sumaPonderada(mes)>MinD);
constraint forall (mes in 1..6) (sumaPonderada(mes)<MaxD);

%almacenamiento
constraint forall (aceite in AceitesVeg) (almacVeg[1,aceite] = compVeg[1,aceite]-refinVeg[1,aceite]);
constraint forall (mes in 2..6) (forall (aceite in AceitesVeg) (almacVeg[mes,aceite] = compVeg[mes,aceite]+almacVeg[mes-1,aceite]-refinVeg[mes,aceite]));
constraint forall (aceite in AceitesNoVeg) (almacNoVeg[1,aceite] = compNoVeg[1,aceite]-refinNoVeg[1,aceite]);
constraint forall (mes in 2..6) (forall (aceite in AceitesNoVeg) (almacNoVeg[mes,aceite] = compNoVeg[mes,aceite]+almacNoVeg[mes-1,aceite]-refinNoVeg[mes,aceite]));

%tenemos que tener una cantidad exacta de cada tipo de aceite al final de junio
%a lo mejor hay que restar a almac lo que se refina en junio y sumar lo que se compra ese mes
constraint forall (aceite in AceitesVeg) (almacVeg[6,aceite] = cantidadVeg[aceite]); 
constraint forall (aceite in AceitesNoVeg) (almacNoVeg[6,aceite] = cantidadNoVeg[aceite]);


%FUNCIONES

%funcion que calcula la suma ponderada (aceiteRefinado(i)*durezaAceite(i) / totalAceite) de un mes
function var float:sumaPonderada(int:mes) = ((sum (veg in AceitesVeg) (refinVeg[mes,veg] * durezaVeg[veg])) + (sum (noveg in AceitesNoVeg) (refinNoVeg[mes,noveg] * durezaNoVeg[noveg])))/refinMes(mes); 
%funcion que calcula el total de producto vendido en un mes
function var int: refinMes(int:mes) = sum (aceite in AceitesVeg) (refinVeg[mes,aceite]) + sum (aceiteN in AceitesNoVeg) (refinNoVeg[mes,aceiteN]);


%funcion que calcula gastos totales en un mes determinado
function var int:gastos(int:mes) = gastosCompras(mes) + gastosAlmacenamiento(mes);
%funcion que calcula gastos en compras en un mes determinado
function var int:gastosCompras(int:mes)= (sum (aceite in AceitesVeg) (compVeg[mes,aceite]*preciosVeg[mes,aceite]) + sum (aceite in AceitesNoVeg) (compNoVeg[mes,aceite]*preciosNoVeg[mes,aceite])*CA);
%funcion que calcula gastos en almacenamiento en un mes determinado
function var int:gastosAlmacenamiento(int:mes)=sum(aceite in AceitesVeg) (almacVeg[mes,aceite]) + sum(aceite in AceitesNoVeg) (almacNoVeg[mes,aceite]);
%funcion que calcula el beneficio final (sumatorio de los aceites que hemos refinado cada mes * valor del producto refinado)
function var int:benef() = ((sum (mes in 1..6)(sum (aceite in AceitesVeg) (refinVeg[mes,aceite])) + sum (mes in 1..6)(sum (aceiteN in AceitesNoVeg) (refinNoVeg[mes,aceiteN]))) * VALOR) - (sum (mes in 1..6) (gastos(mes)));


solve maximize benef(); 
%output ["Beneficio total = "] ++ ["\(benef())"]; 
