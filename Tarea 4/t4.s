.data
	f:	.word 2  @funcion
	x:	.word 3  @valor de x para la primera funcion
	n:	.word 20 @valor de n para primera y segunda funcion
	str: 	.asciz "Error con el numero f, no valido"

.text
main:	
	@almacenar los valores de x,n,f
	ldr r0, =x
	ldr r0, [r0]

	ldr r1, =n
	ldr r1, [r1]

	ldr r2, =f
	ldr r2, [r2]

	cmp r2, #1	@ Primera funcion(fuumo)
	bne funcion2
	mov r2, r1
	mov r1, r0
	bl fuumo
	mov r2, r0
	b print_stop

funcion2:
	cmp r2, #2	@ Segunda funcion (aureo)
	bne error
	bl aureo
	b print_stop

error:
	ldr r2, =str	@ En otro caso
	bl printString
	b stop

print_stop:
	mov r2, r0
	mov r0,#0
	mov r1, #0 
	bl printInt
	b stop




@ args:
@	r1: x
@	r2: n
@ returns:
@	r0
fuumo:
  	cmp r2, #0
  	bne elif               
	mov r0, #1
	b return
elif:
  	cmp r2, #1              
  	bne else                
	mov r0, #2
  	mul r0, r1, r0            
  	b return
else:
	sub r2, r2, #1
	mov r5, lr
	push { r1, r2, r5 }
	bl fuumo
	pop { r1, r2, r5 }
	mul r0, r1, r0
	mov r3, r0
	sub r2, r2, #1
	push { r1, r2, r3, r5 }
	bl fuumo
	pop { r1, r2, r3, r5 }
	add r2, r2, #1
	mul r0, r2, r0
	sub r0, r3, r0
	mov r2, #2
	mul r0, r2, r0
	mov lr, r5
	b return
	
aureo:
	mov r5, lr
	push {r1, r5}
	bl lucas
	pop {r1, r5}
	mov r6, r0
	push {r5, r6}
	bl fibonacci
	pop {r5,r6}
	
	@r0 = fibonacci(n);r6= lucas(n);r5= lr
	
	mov r3, #100	@escalar 100
	mov r4, #224	@escalar 224

	mul r6, r3, r6
	mul r0, r4, r0

	add r0, r0,r6
	
	mov r1,#200
	push { r5 }
	bl sdivide
	pop { r5 }
	mov lr, r5
	b return

@ r0 retorno, r1 valor n
lucas:
	cmp r1,#0
	beq ret2
	cmp r1, #1
	beq ret1
	sub r1, r1, #1		@n-1

	@ejecucion de n-1
	mov r3, lr		
	push {r1,r3}		@guardando en la pila el valor de n-1 con el retorno en la pila
	bl lucas
	pop {r1,r3}		@saca el valor de n-1 con el retorno en la pila
	mov r4, r0		@r4 esta el valor de lucas(n-1)
	
	sub r1,r1,#1		@n-2
	push {r3,r4}
	bl lucas
	pop {r3,r4}
	add r0,r0,r4
	mov lr,r3
	b return 

fibonacci:
	cmp r1,#0
	beq ret0
	cmp r1, #1
	beq ret1
	sub r1, r1, #1		@n-1

	@ejecucion de n-1
	mov r3, lr		
	push {r1,r3}		@guardando en la pila el valor de n-1 con el retorno en la pila
	bl fibonacci
	pop {r1,r3}		@saca el valor de n-1 con el retorno en la pila
	mov r4, r0		@r4 esta el valor de fibonacci(n-1)
	
	sub r1,r1,#1		@n-2
	push {r3,r4}
	bl fibonacci
	pop {r3,r4}
	add r0,r0,r4
	mov lr,r3
	b return
	


@retornos
ret0:
	mov r0, #0
	b return
ret1:
	mov r0, #1
	b return
ret2:
	mov r0,#2
	b return
return: 
	mov pc,lr

stop: 	wfi
