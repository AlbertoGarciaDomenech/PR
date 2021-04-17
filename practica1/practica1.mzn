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
array[1..N] of 1..C: categ; %categorias de trabajadores
array[1..N,1..N] of 0..1:afin;%matriz simetrica con compañeros afines (1 afin, 0 no afin)

%solucion en forma de matriz de DiasxNum trabajadores
%  T| 1 2 3 4
%D
%--
%1  N1 ...
%2  N2 ...
%...
%formato de la solucion
array[1..D,1..N] of var 0..3:sol; % 0 = libra; 1 = turno 1; 2 = turno 2; 3 = turno 3

%constraint asserts
constraint assert (N >= (N1+N2+N3) ,"Tiene que haber suficientes trabajadores para rellenar las tareas");
constraint assert(D >= MinDT, "No puede haber menos dias minimos trabajados que dias totales");
constraint assert (A < N1 /\ A < N2 /\ A < N3, "No puede haber mas trabajadores afines que trabajadores por turno");
constraint assert(C <= N1 /\ C <= N2 /\ C <= N3, "No puede haber mas categorias que trabajadores por turno, dado que tiene que haber un trabajador de cada categoria como minimo por turno");
%relacion MaxDT y minDT
constraint assert ((D - (D/MaxDT)) >= MinDT, "Los dias totales menos el numero de dias libres minimo que va a haber tiene que ser mayor o igual que el minimo de dias trabajados");

%cada turno tiene su numero de trabajadores
constraint forall (i in 1..D) ((sum(j in 1..N) (bool2int(sol[i,j] = 1)))=N1);
constraint forall (i in 1..D) ((sum(j in 1..N) (bool2int(sol[i,j] = 2)))=N2);
constraint forall (i in 1..D) ((sum(j in 1..N) (bool2int(sol[i,j] = 3)))=N3);

%ningun trabajador puede trabajar mas de MaxDT dias consecutivos
%en cada intervalo de MaxDT dias hay al menos un dia libre (tiene que ser MaxDT+1?)
constraint forall (i in 1..N) ((forall (j in 1..(D-MaxDT)) ((sum (k in 0..(MaxDT-1)) (bool2int(sol[j+k,i] = 0))) >= 1))); %hacer con sets
%ningun trabajador puede trabajar mas de MaxDL dias libres
%en cada intervalo de MaxDL dias hay al menos un dia de trabajo (tiene que ser MaxDL+1?)
constraint forall (i in 1..N) ((forall (j in 1..(D-MaxDL)) ((sum (k in 0..(MaxDL-1)) (bool2int(sol[j+k,i] != 0))) >= 1))); %hacer con sets
%todos deben tener minDT trabajados (dias libres tienen que ser menores que (D-minDT)
constraint forall (i in 1..N) ((sum (j in 1..D) (bool2int((sol[j,i] = 0)))) < (D-MinDT));

%un trabajador no puede hacer el ultimo turno de un dia y el primero del siguiente dos veces seguidas en cuatro dias seguidos
%constraint forall(i in 1..D-3) (forall (j in 1..N) (sol[i,j] = 3 /\ sol[i+1,j] != 1 /\ sol[i+2,j] = 3 /\ sol[i+3,j] != 1));
constraint forall (j in 1..N) (forall (i in 1..D-3) (sum (k in 0..2) (sol[i+k, j] = 3 /\ sol[i+k+1, j] = 1) < 2));

%cada trabajador de turno tiene que estar con al menos A trabajadores afines en ese turno
constraint forall(i in 1..D) (forall (j in 1..3) ((forall (k in 1..N) (sol[i,k] = j /\ (sum(w in 1..N where sol[i,w] == j /\ w!=k)(afin[k,w])>= A)))));

%en cada turno tiene que haber un trabajador de cada categoria
constraint forall (i in 1..D) (forall (j in 1..N) (forall (k in 1..3) (forall (c in 1..C where categ[j]=c)((sum(bool2int(sol[i,j]=k)))>=1))));