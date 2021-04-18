int:N1; %numero de trabajadores que tienen que estar en el turno 1
int:N2; %numero de trabajadores que tienen que estar en el turno 2
int:N3; %numero de trabajadores que tienen que estar en el turno 3
int:D; %numero de dias consecutivos
int:N; %numero de trabajadores
int:MaxDT; %numero de dias maximos seguidos que nadie puede trabajar
int:MaxDL; %numero de dias maximos seguidos libres que nadie puede tener
int:MinDT; %numero de dias minimos que cada trabajador debe tener
int:A; %minimo de trabajadores afines que tiene que haber en un turno
int:C; %numero de categorias
set of int: DIAS = 1..D;
set of int: TRABAJADORES = 1..N;
set of int: TURNOS = 1..3; %no incluye descanso
set of int: CATEGORIAS = 1..C;
array[TRABAJADORES] of CATEGORIAS: categ; %categorias de trabajadores
array[1..3] of int: numcateg;
array[TRABAJADORES,TRABAJADORES] of 0..1:afin;%matriz simetrica con compañeros afines (1 afin, 0 no afin)
array[TRABAJADORES,DIAS] of 0..1:diasPedidos; %matriz con los dias libre pedidos por los trabajadores(0 no pedido, 1 pedido)
array[TRABAJADORES] of 0..3:prefTurnos; %array con las preferencias de los turnos que no quieren los trabajadores(0 no tiene preferencia)
%array[TRABAJADORES,DIAS] of 0..3:prefDiasTurnos; %matriz con las preferencias por dias de los turnos que no quieren los trabajadores
%solucion en forma de matriz de DiasxNum trabajadores
%  T| 1 2 3 4
%D
%--
%1  N1 ...
%2  N2 ...
%...
%formato de la solucion
array[DIAS,TRABAJADORES] of var 0..3:sol; % 0 = libra; 1 = turno 1; 2 = turno 2; 3 = turno 3

%constraint asserts
constraint assert (N >= (N1+N2+N3) ,"Tiene que haber suficientes trabajadores para rellenar las tareas");
constraint assert(D >= MinDT, "No puede haber menos dias minimos trabajados que dias totales");
constraint assert (A < N1 /\ A < N2 /\ A < N3, "No puede haber mas trabajadores afines que trabajadores por turno");
constraint assert(C <= N1 /\ C <= N2 /\ C <= N3, "No puede haber mas categorias que trabajadores por turno, dado que tiene que haber un trabajador de cada categoria como minimo por turno");
constraint assert(MaxDL > 0, "Los trabajadores no pueden librar 0 o menos dias seguidos");
constraint assert(MaxDT > 0, "Los trabajadores no pueden trabajar 0 o menos dias seguidos");

%relacion MaxDT y minDT
constraint assert ((D - floor(D/MaxDT)) >= MinDT, "Los dias totales menos el numero de dias libres minimo que va a haber tiene que ser mayor o igual que el minimo de dias trabajados");
%matriz de afines simetrica
%constraint assert (forall(i in TRABAJADORES) (forall (j in 1..i) (afin[i, j] = 0)), "La matriz de afines no es valida");
constraint assert (forall(i in TRABAJADORES) (forall (j in TRABAJADORES) (afin[i, j] = afin[j, i])), "La matriz de afines no es simetrica"); 
constraint assert (forall(i in TRABAJADORES) (afin [i, i] = 0), "Un trabajador no puede ser afin consigo mismo"); 

%cada turno tiene su numero de trabajadores
constraint forall (i in DIAS) ((sum(j in TRABAJADORES) (bool2int(sol[i,j] = 1)))=N1);
constraint forall (i in DIAS) ((sum(j in TRABAJADORES) (bool2int(sol[i,j] = 2)))=N2);
constraint forall (i in DIAS) ((sum(j in TRABAJADORES) (bool2int(sol[i,j] = 3)))=N3);

%ningun trabajador puede trabajar MaxDT o mas dias consecutivos
constraint forall (i in TRABAJADORES) ((forall (j in 1..(D-MaxDT+1)) ((sum (k in 0..(MaxDT-1)) (bool2int(sol[j+k,i] = 0))) >= 1)));
%ningun trabajador puede librar MaxDL o mas dias libres seguidos
constraint forall (i in TRABAJADORES) ((forall (j in 1..(D-MaxDL+1)) ((sum (k in 0..(MaxDL-1)) (bool2int(sol[j+k,i] != 0))) >= 1)));
%si añadimos que los  trabajadores puedan pedir dias y que no cuenten en la restriccion de dias libres consecutivos:
constraint forall (i in TRABAJADORES) ((forall (j in 1..(D-MaxDL)) ((sum (k in 0..(MaxDL-1)) (bool2int(sol[j+k,i] != 0 \/ diasPedidos[i,j+k]=1))) >= 1)));
%todos deben tener MinDT trabajados
constraint forall (i in TRABAJADORES) ((sum (j in DIAS) (bool2int((sol[j,i] != 0)))) >= MinDT);
%si añadimos que los trabajadores puedan pedir dias y que se descuenten de MinDT:
constraint forall (i in TRABAJADORES) ((sum (j in DIAS) (bool2int((sol[j,i] != 0)))) >= (MinDT - (sum (j in DIAS) (diasPedidos[i,j]))));

%en cada intervalo de 4 dias, la suma de veces que se trasnocha es menor que 2
constraint forall (j in TRABAJADORES) (forall (i in 1..D-3) (sum (k in 0..2) (bool2int(sol[i+k, j] = 3 /\ sol[i+k+1, j] = 1)) < 2));

%cada trabajador de turno tiene que estar con al menos A trabajadores afines en ese turno
constraint forall(i in DIAS) ((forall (k in TRABAJADORES) (sum(w in TRABAJADORES where sol[i,w] == sol[i, k])(afin[k,w])>= A \/ sol[i, k] = 0)));



%en cada turno tiene que haber un trabajador de cada categoria
constraint forall (i in DIAS) (forall(k in TURNOS) (forall(c in CATEGORIAS)(sum(j in TRABAJADORES where categ[j] = c)(bool2int(sol[i,j]=k)) >=numcateg[k])));

%satisfaccion
%solve satisfy;

%primera parte optimizacion
solve minimize (sum (i in DIAS) (sum(j in TRABAJADORES) (bool2int(sol[i,j]!=0 /\ diasPedidos[j,i]=1))));
%repartido entre los trabajadores
%solve maximize trabj(sol,diasPedidos);

%segunda parte optimizacion
%con array
%solve minimize (sum (i in DIAS) (sum(j in TRABAJADORES) (bool2int(sol[i,j] = prefTurnos[j] /\ prefTurnos[j] != 0))));
%repartido entre los trabajadores
%solve maximize (sum(j in TRABAJADORES) (bool2int(sum (i in DIAS) (bool2int(sol[i,j] = prefTurnos[j] /\ prefTurnos[j] != 0)) > 1)));
%con matriz
%solve minimize (sum (i in DIAS) (sum(j in TRABAJADORES) (bool2int(sol[i,j] = prefDiasTurnos[j,i] /\ prefDiasTurnos[j,i] != 0))));

function var int: trabj(array[int,int] of var int: sol, array[int,int] of 0..1: diasPedidos) = (sum(j in TRABAJADORES) (bool2int(sum (i in DIAS) (bool2int(sol[i,j]!=0 /\ diasPedidos[j,i]=1)) > 1)));  

output ["Turnos de los trabajadores por dias: \n"] ++ ["TRABJ "] ++ ["|\(i) "| i in TRABAJADORES] ++ ["\n"] ++ [(if j == 1 then "DIA \(i):" else "" endif) ++ "|\(sol[i,j]) " ++ (if j == N then "\n" else "" endif)|i in DIAS, j in TRABAJADORES];
output ["Veces que ignoramos peticion de librar un dia: \(sum (i in DIAS) (sum(j in TRABAJADORES) (bool2int(sol[i,j]!=0 /\ diasPedidos[j,i]=1))))\n"];
output ["Trabajadores a los que ignoramos su peticion de librar: "]++ ["\(trabj(sol,diasPedidos))\n"];
output ["Veces que ignoramos petición de no cubrir un turno en especifico: "] ++ ["\(sum (i in DIAS) (sum(j in TRABAJADORES) (bool2int(sol[i,j] = prefTurnos[j] /\ prefTurnos[j] != 0))))\n"];
output ["Trabajadores a los que ignoramos su peticion de turno: "] ++ ["\(sum(j in TRABAJADORES) (bool2int(sum (i in DIAS) (bool2int(sol[i,j] = prefTurnos[j] /\ prefTurnos[j] != 0)) > 1)))"];