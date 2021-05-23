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
    
array[AceitesVeg] of float:durezaVeg;                         %dureza de aceites vegetales
array[AceitesNoVeg] of float:durezaNoVeg;                     %dureza aceites no vegetales

%array[AceitesVeg] of 

array[1..6, AceitesVeg] of var 0..MAXV:refinVeg;             %aceite vegetal refinado cada mes (cota maxima de MAXV por mes)
array[1..6, AceitesNoVeg] of var 0..MAXN:refinNoVeg;         %aceite no vegetal refinado cada mes(cota maxima de MAXN por mes)

array[1..6,AceitesVeg] of var 0..MCAP:almacVeg;              %cantidad almacenada aceite vegetal por mes(cota maxima MCAP por mes)
array[1..6,AceitesNoVeg] of var 0..MCAP: almacNoVeg;        %cantidad almacenada aceite no vegetal por mes

array[1..6, AceitesVeg] of var 0..MCAP+MAXV:compVeg;         %compras de aceite vegetal por mes,cota maxima de almacenamiento + refinado(no se almacena)
array[1..6, AceitesNoVeg] of var 0..MCAP+MAXN:compNoVeg;     %compras de aceite no vegetal por mes

solve maximize (sum (i in 1..6) (refinVeg[i,VEG1]+refinVeg[i,VEG2]+refinNoVeg[i,ANV1]+refinNoVeg[i,ANV2]+refinNoVeg[i,ANV3])*VALOR);