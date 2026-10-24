; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 4.1. Mayor, menor o igual con entrada del usuario ; Descripción: Compara dos números ingresados e indica mediante saltos condicionales si el primero es mayor, menor o igual.
INCLUDE Irvine32.inc

.data
	mensaje1   BYTE "Ingresa el primer numero : ",0
	Num1       SDWORD ?
	mensaje2   BYTE "Ingresa el segundo numero : ",0
	Num2       SDWORD ?
	msgIguales BYTE "Los valores son iguales",0
	msgMayor   BYTE "El valor 1er es mayor",0
	msgMenor   BYTE "El valor 1er es menor",0

.code
main PROC
	mov edx, OFFSET mensaje1
	call WriteString
	call ReadInt
	mov Num1, eax
	call Crlf

	mov edx, OFFSET mensaje2
	call WriteString
	call ReadInt
	mov Num2, eax
	call Crlf

	mov eax, Num1
	cmp eax, Num2

	je iguales
	jg mayor
	jl menor

iguales:
	mov edx, OFFSET msgIguales
	call WriteString
	jmp fin

mayor:
	mov edx, OFFSET msgMayor
	call WriteString
	jmp fin

menor:
	mov edx, OFFSET msgMenor
	call WriteString

fin:
	call Crlf
	exit
main ENDP
END main