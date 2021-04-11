int:altura;
enum Color = {azul, rojo, verde};
array [0..altura-1] of var Color: torre;  
array [Color] of int:capacidad;
%condicion num piezas
constraint (sum (i in 0..altura-1) (torre[i]=azul) <= capacidad[azul]);
constraint (sum (i in 0..altura-1) (torre[i]=rojo) <= capacidad[rojo]);
constraint (sum (i in 0..altura-1) (torre[i]=verde) <= capacidad[verde]);
%condicion dos piezas verdes no pueden estar seguidas
constraint forall (i in 0..(altura-2)) 
           (torre[i] = verde -> torre[i+1] != verde);          
%condicion piezas verdes < piezas azul
constraint forall (i in 0..altura-1) (sum(j in 0..i)(bool2int(torre[j]=verde)) <= sum (j in 0..i) (bool2int(torre[j]=azul)));           
%condicion pieza roja al principio siempre
constraint torre[0] = rojo;
%condicion piezas rojas > piezas verdes + piezas azules   
constraint (sum (i in 0..altura-1)(bool2int(torre[i]=rojo))) >= (sum (i in 0..altura-1)(bool2int(torre[i]=verde \/ torre[i] = azul)));        
     
solve satisfy;
