# Practica 2 asignatura PR: Alberto García Doménech & David Godoy Ruiz

#!/usr/bin/python3

import sys
import io  

filenameIn = sys.argv[1]
filenameOut = sys.argv[2]
print(filenameOut)
myinput = "".join(open(filenameIn, "r").readlines())
sys.stdin = io.StringIO(myinput)
sys.stdout = open(filenameOut, mode='w')

#inicializar variables
VALOR = input()#int(input())
MAXV = input()#int(input())
MAXN = input()#int(input())
MCAP = input()#int(input())
CA = input()#int(input())
MinD = input()#int(input())
MaxD = input()#int(input())
# MaxD = str(10)
MinB = input()#int(input())
numMeses = 6
numAceitesVeg = 2
numAceitesNoVeg = 3
inp = input().split()
AceitesVeg = [inp[0],inp[1]]
inp = input().split()
AceitesNoVeg = [inp[0],inp[1],inp[2]]
inp = input().split()
preciosVeg = [[0 for x in range(numAceitesVeg)] for x in range(numMeses)]
cont = 0
for i in range(len(preciosVeg)) : 
    for j in (range(len(preciosVeg[i]))) : 
        preciosVeg[i][j] = int(inp[cont])
        cont+=1
inp = input().split()
preciosNoVeg = [[0 for x in range(numAceitesNoVeg)] for x in range(numMeses)]
cont = 0
for i in range(len(preciosNoVeg)):
    for j in range(len(preciosNoVeg[i])):
        preciosNoVeg[i][j] = int(inp[cont])
        cont+=1
inp = input().split()
durezaVeg = [int(i) for i in inp]
inp = input().split()
durezaNoVeg = [int(i) for i in inp]
inp = input().split()
cantidadVeg = [int(inp[0]),int(inp[1])]
inp = input().split()
cantidadNoVeg = [int(inp[0]),int(inp[1]),int(inp[2])]
# print("VALOR = ", VALOR, "\nMAXV = ", MAXV, "\nMAXN = ", MAXN, "\nMCAP = ",MCAP)
# print("\nCA = ", CA, "\nMinD = " ,MinD, "\nMaxD =", MaxD, "\nMinB = ", MinB)
# print("\ntipos de aceite vegetal", AceitesVeg, "\ntipos de aceite no vegetal", AceitesNoVeg)
# print("\nprecios vegetal ", preciosVeg, "\nprecios no vegetal ", preciosNoVeg)
# print("\ndureza vegetal ", durezaVeg, "\ndureza no vegetal ", durezaNoVeg)
# print("\ncantidad veg ", cantidadVeg,"\ncantidad no vegetal ",cantidadNoVeg)

def set_logic(l):
    return "(set-logic "+ l +")"

def intvar(v):
    return "(declare-fun "+v+" () Int)"

def bool2int(b):
    return "(ite "+b+" 1 0 )"

def addand(a1,a2):
    return "(and "+a1+" "+a2+" )"
def addor(a1,a2):
    return "(or "+a1+" "+a2+" )"
def addnot(a):
    return "(not "+a+" )"
def addimplication(p,q):
    return "(=> " +p+ " " +q +" )"

def addexists(a):
    if len(a) == 0:
        return "false"
    elif len(a) == 1:
        return a[0]
    else :
        x = a.pop()
        return "(or " + x + " " + addexists(a) + " )" 

def addeq(a1,a2):
    return "(= "+a1+" "+a2+" )" 
def addle(a1,a2):
    return "(<= "+a1+" "+a2+" )" 
def addge(a1,a2):
    return "(>= "+a1+" "+a2+" )" 
def addlt(a1,a2):
    return "(< "+a1+" "+a2+" )"
def addgt(a1,a2):
    return "(> "+a1+" "+a2+" )" 

def addplus(a1,a2):
    return "(+ "+a1+" "+a2+" )"

def addresta(a1,a2):
    return "(- " +a1 + " "+ a2+ " )"

def addmul(a1,a2):
    return "(* " +a1+" "+a2 +" )"

def addassert(a):
    return "(assert "+a+" )"

# peso por defecto:1 condiciones no fuertes <1
def addassertPeso(a,w):
    return "(assert-soft " +a+" :weight " +w+ ")"

def addsum(a):
    if len(a) == 0:
        return "0"
    elif len(a) == 1:
        return a[0]
    else :
        x = a.pop()
        return "(+ " + x + " " + addsum(a) + " )" 




def refinVeg(i,j):
    return "refinVeg_"+str(i)+"_" + str(j)
def refinNoVeg(i,j):
    return "refinNoVeg_"+str(i)+ "_" + str(j)
def almacVeg(i,j):
    return "almacVeg_" + str(i) + "_" + str(j)
def almacNoVeg(i,j):
    return "almacNoVeg_" + str(i) + "_" + str(j)
def compVeg(i,j):
    return "compVeg_" + str(i) + "_" + str(j)
def compNoVeg(i,j):
    return "compNoVeg_" + str(i) + "_" + str(j)

def benef(i):
    return "benef_" + str(i)


def checksat():
    print("(check-sat)")
def getmodel():
    print("(get-model)")
def getvalue(l):
    print("(get-value " + l + " )")

################################
# generamos un fichero smtlib2
################################

print("(set-option :produce-models true)")
print(set_logic("QF_LIA"))

#declaración de variables de la solución
for i in range(numMeses):
    for j in range(numAceitesVeg):
        print(intvar(refinVeg(i,j)))
        print(intvar(compVeg(i,j)))
        print(intvar(almacVeg(i,j)))
    for j in range(numAceitesNoVeg):
        print(intvar(refinNoVeg(i,j)))
        print(intvar(compNoVeg(i,j)))
        print(intvar(almacNoVeg(i,j)))
    print(intvar(benef(i)))
# fin declaración

# ASSERTS

# constraint assert ( VALOR > 0,"El valor del aceite tiene que ser positivo");
print(addassert(addgt(VALOR,"0")))
# constraint assert ( MAXV > 0,"El maximo de aceite vegetal refinado tiene que ser positivo");
print(addassert(addgt(MAXV,"0")))
# constraint assert ( MAXN > 0,"El maximo de aceite no vegetal refinado tiene que ser positivo");
print(addassert(addgt(MAXN,"0")))
# constraint assert ( MCAP > 0, "La capacidad de almacenamiento maxima tiene que ser mayor que 0");
print(addassert(addgt(MCAP,"0")))
# constraint assert(MinD < MaxD, "La dureza minima tiene que ser menor que la dureza maxima");
print(addassert(addlt(MinD,MaxD)))
# constraint assert((forall (i in AceitesVeg) (cantidadVeg[i] <= MCAP)) /\ (forall (i in AceitesNoVeg) (cantidadNoVeg[i] <= MCAP)), "La cantidad final de cada aceite no puede superar el limite de almacenamiento");
for i in range(numAceitesVeg):
    print(addassert(addle(str(cantidadVeg[i]),MCAP)))
for i in range(numAceitesNoVeg):
    print(addassert(addle(str(cantidadNoVeg[i]),MCAP)))
# CONSTRAINTS

# Constraints implicitas 
# no podemos tener almacenamiento,compras o refin negativos
# el valor maximo de compras tiene que ser como max MAX(V o N) + MCAP
for i in range(numMeses):
    for j in range(numAceitesVeg):
        print(addassert(addge(almacVeg(i,j),"0")))
        print(addassert(addge(compVeg(i,j),"0")))
        print(addassert(addge(refinVeg(i,j),"0")))
        print(addassert(addle(compVeg(i,j),str((int(MCAP)+int(MAXV))))))

    for j in range(numAceitesNoVeg):
        print(addassert(addge(almacNoVeg(i,j),"0")))
        print(addassert(addge(compNoVeg(i,j),"0")))
        print(addassert(addge(refinNoVeg(i,j),"0")))
        print(addassert(addle(compNoVeg(i,j),str((int(MCAP)+int(MAXN))))))


# constraint forall (mes in meses) ((sum (aceite in AceitesVeg) (refinVeg[mes,aceite]))<MAXV);
for i in range(numMeses):
    suma = []
    for j in range(numAceitesVeg):
        suma.append(refinVeg(i,j))
    print(addassert(addlt(addsum(suma),MAXV)))
# constraint forall (mes in meses) ((sum (aceite in AceitesNoVeg) (refinNoVeg[mes,aceite]))<MAXN);
for i in range(numMeses):
    suma = []
    for j in range(numAceitesNoVeg):
        suma.append(refinNoVeg(i,j))
    print(addassert(addlt(addsum(suma),MAXN)))

# constraint forall (i in meses) (forall (aceite in AceitesVeg) (almacVeg[i,aceite] + compVeg[i,aceite] >= refinVeg[i,aceite]));
# constraint forall (i in meses) (forall (aceite in AceitesNoVeg) (almacNoVeg[i,aceite] + compNoVeg[i,aceite] >= refinNoVeg[i,aceite]));
for i in range(numMeses):
    for j in range(numAceitesVeg):
        print(addassert(addge(addplus(almacVeg(i,j),compVeg(i,j)),refinVeg(i,j))))

    for j in range(numAceitesNoVeg):
        print(addassert(addge(addplus(almacNoVeg(i,j),compNoVeg(i,j)),refinNoVeg(i,j))))

# constraint forall (mes in meses) (sumaPonderada(mes)>MinD*refinMes(mes));
# function var float:sumaPonderada(int:mes) = sum (veg in AceitesVeg) (refinVeg[mes,veg] * durezaVeg[veg]) + sum (noveg in AceitesNoVeg) (refinNoVeg[mes,noveg] * durezaNoVeg[noveg]); 
# function var int: refinMes(int:mes) = sum (aceite in AceitesVeg) (refinVeg[mes,aceite]) + sum (aceiteN in AceitesNoVeg) (refinNoVeg[mes,aceiteN]);
for i in range(numMeses):
    sumaP_mind = []
    sumaP_maxd = []
    refMes_mind = []
    refMes_maxd = []
    for j in range(numAceitesVeg):
        refMes_mind.append(refinVeg(i,j))
        refMes_maxd.append(refinVeg(i,j))
        sumaP_mind.append(addmul(refinVeg(i,j),str(durezaVeg[j])))
        sumaP_maxd.append(addmul(refinVeg(i,j),str(durezaVeg[j])))
    for j in range(numAceitesNoVeg):

        refMes_mind.append(refinNoVeg(i,j))
        refMes_maxd.append(refinNoVeg(i,j))
        sumaP_mind.append(addmul(refinNoVeg(i,j),str(durezaNoVeg[j]))) 
        sumaP_mind.append(addmul(refinNoVeg(i,j),str(durezaNoVeg[j])))
    print(addassert(addand(addgt(addsum(sumaP_mind) ,addmul(MinD,addsum(refMes_mind))),addlt(addsum(sumaP_maxd) ,addmul(MaxD,addsum(refMes_maxd))))))


# constraint forall (aceite in AceitesVeg) (almacVeg[ENERO,aceite] = cantidadVeg[aceite]);
for i in range(numAceitesVeg):
    print(addassert(addeq(almacVeg(0,i),str(cantidadVeg[i]))))
# constraint forall (aceite in AceitesNoVeg) (almacNoVeg[ENERO,aceite] = cantidadNoVeg[aceite]);
for i in range(numAceitesNoVeg):
    print(addassert(addeq(almacNoVeg(0,i),str(cantidadNoVeg[i]))))
# constraint forall (mes in FEBRERO..JUNIO) (forall (aceite in AceitesVeg) (almacVeg[mes,aceite] = compVeg[mes-1,aceite]+almacVeg[mes-1,aceite]-refinVeg[mes-1,aceite]));
for i in range(1,numMeses):
    for j in range(numAceitesVeg):
        suma = []
        resta = []
        suma.append(compVeg(i-1,j))
        suma.append(almacVeg(i-1,j))
        resta.append(refinVeg(i-1,j))
        print(addassert(addeq(almacVeg(i,j),addresta(addsum(suma),addsum(resta)))))
# constraint forall (mes in FEBRERO..JUNIO) (forall (aceite in AceitesNoVeg) (almacNoVeg[mes,aceite] = compNoVeg[mes-1,aceite]+almacNoVeg[mes-1,aceite]-refinNoVeg[mes-1,aceite]));
for i in range(1,numMeses):
    for j in range(numAceitesNoVeg):
        suma = []
        resta = []
        suma.append(compNoVeg(i-1,j))
        suma.append(almacNoVeg(i-1,j))
        resta.append(refinNoVeg(i-1,j))
        print(addassert(addeq(almacNoVeg(i,j),addresta(addsum(suma),addsum(resta)))))
# constraint forall (aceite in AceitesVeg) (almacVeg[JUNIO,aceite]+compVeg[JUNIO,aceite]-refinVeg[JUNIO,aceite] = cantidadVeg[aceite]); 
for i in range(numAceitesVeg):
    suma = []
    resta = []
    suma.append(almacVeg(5,i))
    suma.append(compVeg(5,i))
    resta.append(refinVeg(5,i))
    print(addassert(addeq(addresta(addsum(suma),addsum(resta)),str(cantidadVeg[i]))))
# constraint forall (aceite in AceitesNoVeg) (almacNoVeg[JUNIO,aceite]+compNoVeg[JUNIO,aceite]-refinNoVeg[JUNIO,aceite] = cantidadNoVeg[aceite]);
for i in range(numAceitesNoVeg):
    suma = []
    resta = []
    suma.append(almacNoVeg(5,i))
    suma.append(compNoVeg(5,i))
    resta.append(refinNoVeg(5,i))
    print(addassert(addeq(addresta(addsum(suma),addsum(resta)),str(cantidadNoVeg[i]))))
# constraint forall (mes in meses, aceite in AceitesVeg) (almacVeg[mes,aceite] <= MCAP);
for i in range(numMeses):
    for j in range(numAceitesVeg):
        print(addassert(addle(almacVeg(i,j),MCAP)))
    for j in range(numAceitesNoVeg):
        print(addassert(addle(almacNoVeg(i,j),MCAP)))


# constraint benef()>MinB;

# function var int:benef()= sum (mes in meses) ((sum (aceite in AceitesVeg) (refinVeg[mes,aceite]*VALOR))+(sum (aceite in AceitesNoVeg) (refinNoVeg[mes,aceite]*VALOR)) -(gastos(mes)));
# function var int:gastos(int:mes) = gastosCompras(mes) + gastosAlmacenamiento(mes);
# function var int:gastosCompras(int:mes)= (sum (aceite in AceitesVeg) (compVeg[mes,aceite]*preciosVeg[mes,aceite]) + sum (aceite in AceitesNoVeg) (compNoVeg[mes,aceite]*preciosNoVeg[mes,aceite]));
# function var int:gastosAlmacenamiento(int:mes)=(sum(aceite in AceitesVeg) (almacVeg[mes,aceite]) + sum(aceite in AceitesNoVeg) (almacNoVeg[mes,aceite])) * CA;
for i in range(numMeses):
    gastosC = []
    gastosA = []
    _benef = []
    for j in range(numAceitesVeg):
        _benef.append(refinVeg(i,j))
        gastosC.append(compVeg(i,j))
        gastosA.append(almacVeg(i,j))
    for j in range(numAceitesNoVeg):
        _benef.append(refinNoVeg(i,j))
        gastosC.append(compNoVeg(i,j))
        gastosA.append(almacNoVeg(i,j))
    print(addassert(addeq(benef(i),(addresta((addmul(addsum(_benef),VALOR)), (addplus(addmul(addsum(gastosA),CA),addsum(gastosC))))))))

b = []
for i in range(numMeses):
    b.append(benef(i))
print(addassert(addge(addsum(b),MinB)))
# EXTENSIONES
K = input()
T = input()

# constraint forall (i in meses) ((sum(aceite in AceitesVeg) (bool2int(refinVeg[i,aceite]>0)) + sum(aceite in AceitesNoVeg) (bool2int(refinNoVeg[i,aceite]>0)))<=K);
# restriccion soft
for i in range(numMeses):
    count = []
    for j in range(numAceitesVeg):
        count.append(bool2int((addnot(addeq(refinVeg(i,j),"0")))))
    for j in range(numAceitesNoVeg):
        count.append(bool2int((addnot(addeq(refinNoVeg(i,j),"0")))))
    print(addassertPeso(addlt(addsum(count),K),str(.2)))


# constraint forall (i in meses) ((forall (j in AceitesVeg) (refinVeg[i,j] = 0 \/ refinVeg[i,j] > T)) /\ (forall (k in AceitesNoVeg) (refinNoVeg[i,k]=0\/refinNoVeg[i,k]>T)));
for i in range(numMeses):
    for j in range(numAceitesVeg):
        print(addassert(addor(addeq(refinVeg(i,j),"0"),addgt(refinVeg(i,j),T))))
    for j in range(numAceitesNoVeg):
        print(addassert(addor(addeq(refinNoVeg(i,j),"0"),addgt(refinNoVeg(i,j),T))))

# constraint forall(i in meses) ((refinVeg[i,VEG1]>0 \/ refinVeg[i,VEG1]>0)->refinNoVeg[i,ANV3]>0);
for i in range(numMeses):
    print(addassert(addimplication(addor(addgt(refinVeg(i,0),"0"),addgt(refinVeg(i,1),"0")),addgt(refinNoVeg(i,2),"0"))))
b = []
for i in range(numMeses):
    b.append(benef(i))
# objetivo de maximizacion
print("(maximize " + addsum(b) + " )")
print("(check-sat)")
print("(get-objectives)")


# # OUTPUT
# for i in range(numMeses):
#     for j in range(numAceitesVeg):
#         getvalue("("+ almacVeg(i,j)+")")
#     for j in range(numAceitesNoVeg):
#         getvalue("("+ almacNoVeg(i,j)+")")
# for i in range(numMeses):
#     for j in range(numAceitesVeg):
#         getvalue("("+ compVeg(i,j)+")")
#     for j in range(numAceitesNoVeg):
#         getvalue("("+ compNoVeg(i,j)+")")
# for i in range(numMeses):    
#     for j in range(numAceitesVeg):
#         getvalue("("+ refinVeg(i,j)+")")
#     for j in range(numAceitesNoVeg):
#         getvalue("("+ refinNoVeg(i,j)+")")

# for i in range(numMeses):
#     getvalue("(" + benef(i) + ")")
