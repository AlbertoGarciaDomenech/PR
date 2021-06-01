#!/usr/bin/python3

import sys
import io  

filenameIn = sys.argv[1]
#filenameOut = sys.argv[2]
#print(filenameOut)
myinput = "".join(open(filenameIn, "r").readlines())
sys.stdin = io.StringIO(myinput)
#sys.stdout = open(filenameOut, mode='w')

#inicializar variables
VALOR = int(input())
MAXV = int(input())
MAXN = int(input())
MCAP = int(input())
CA = int(input())
MinD = int(input())
MaxD = int(input())
MinB = int(input())
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
durezaVeg = [float(i) for i in inp]
inp = input().split()
durezaNoVeg = [float(i) for i in inp]
inp = input().split()
cantidadVeg = [int(inp[0]),int(inp[1])]
inp = input().split()
cantidadNoVeg = [int(inp[0]),int(inp[1]),int(inp[2])]
print("VALOR = ", VALOR, "\nMAXV = ", MAXV, "\nMAXN = ", MAXN, "\nMCAP = ",MCAP)
print("\nCA = ", CA, "\nMinD = " ,MinD, "\nMaxD =", MaxD, "\nMinB = ", MinB)
print("\ntipos de aceite vegetal", AceitesVeg, "\ntipos de aceite no vegetal", AceitesNoVeg)
print("\nprecios vegetal ", preciosVeg, "\nprecios no vegetal ", preciosNoVeg)
print("\ndureza vegetal ", durezaVeg, "\ndureza no vegetal ", durezaNoVeg)
print("\ncantidad veg ", cantidadVeg,"\ncantidad no vegetal ",cantidadNoVeg)

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
    return "(=> " +p+ " " +q +")"

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

def addassert(a):
    return "(assert "+a+" )"

def addsum(a):
    if len(a) == 0:
        return "0"
    elif len(a) == 1:
        return a[0]
    else :
        x = a.pop()
        return "(+ " + x + " " + addsum(a) + " )" 




def refinVeg(i,j):
    return "refinVeg "+str(i)+" " + str(j)
def refinNoVeg(i,j):
    return "refinNoVeg "+str(i)+" " str(j)
def almacVeg(i,j):
    return "almacVeg " + str(i) + " " + stri(j)
def almacNoVeg(i,j):
    return "almacNoVeg " + str(i) + " " + stri(j)
def compVeg(i,j):
    return "compVeg " + str(i) + " " + str(j)
def compNoVeg(i,j):
    return "compNoVeg " + str(i)



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
# fin declaración

# constraint forall (mes in meses) ((sum (aceite in AceitesVeg) (refinVeg[mes,aceite]))<MAXV);
for i in numMeses:
    for j in numAceitesVeg:
        print(addassert(addlt(refinVeg(i,j),MAXV)))
# constraint forall (mes in meses) ((sum (aceite in AceitesNoVeg) (refinNoVeg[mes,aceite]))<MAXN);
for i in numMeses:
    for j in numAceitesNoVeg:
        print(addassert(addlt(refinNoVeg(i,j),MAXN)))

# constraint forall (mes in meses) (sumaPonderada(mes)>MinD*refinMes(mes));
for i in numMeses:
    suma = []
    refMes = []
    for j in numAceitesVeg:
        suma.append(refinVeg(i,j))
    refMes = 
    print(addassert(addgt(MinD*refMes)))


# constraint forall (mes in meses) (sumaPonderada(mes)<MaxD*refinMes(mes));
# function var float:sumaPonderada(int:mes) = sum (veg in AceitesVeg) (refinVeg[mes,veg] * durezaVeg[veg]) + sum (noveg in AceitesNoVeg) (refinNoVeg[mes,noveg] * durezaNoVeg[noveg]); 
