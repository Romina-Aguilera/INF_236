Nombre: Romina Aguilera Otárola
Rol:202173572-0
Paralelo: 200

Nombre:Juan Daniel Alegría Vasquez
Rol: 202023510-4
Paralelo: 201
------------------------------------------------------------------------------------------
ALGORITMOS Y DESARROLLO:
- En el "main" se almacena los valores de los input y luego ses compara el valor
de la funcion para saber si ejecutar "fuumo" o "aureo", en caso de no ser valido, 
el programa se detiene

-Para fuumo primero se calcula el valor de n-1 y se guarda en la pila los valores de lr,n-1 y x
luego se vuelve a llamar a la funcion, luego, se extraen los valores de la pila y se comienza a 
calcular n-2 y se aplica un algoritmo similar, ya que ahora se multiplica por n-1. Una vez con esto
calculado se multiplica toda la expresion por dos, se retorna el valor, imprime y termina

- Para "lucas" y "fibonacci" primero se calcula el valor de n-1 y se almacena en una
pila junto con lr, luego se calcula el valor de n-2 y se implementa el mismo algoritmo

- Para obtener el aureo, se obtienen los valores de lucas(n) y fibonacci(n) almacenandolos
en pila, y luego se calcula su valor, se imprime y finaliza el programa
------------------------------------------------------------------------------------------
SUPUESTOS UTILIZADOS:
- Para calcular el numero aureo se utilizó la formula
	(lucas(n)*100 + fibonacci(n)*224)/200
  Se calculo un aproximado de la raíz de 5 y luego se multiplico
  por 100 toda la expresión para trabajar con enteros en vez de flotantes