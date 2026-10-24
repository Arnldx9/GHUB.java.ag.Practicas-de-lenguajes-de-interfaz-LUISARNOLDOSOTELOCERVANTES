; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 5.1. Repetir hasta que el usuario ingrese cero ; Descripción: Bucle interactivo que solicita continuamente un número hasta que se detecta un cero.
INCLUDE Irvine32.inc

.data
	Mensaje1 BYTE "TECLEA EL NUMERO 0 : ", 0
	Mensaje2 BYTE "ERROR TECLEA EL NUMERO 0 : ", 0
	Num      SDWORD ?

.code
main PROC
	mov edx, OFFSET Mensaje1
	call WriteString
	call ReadInt
	mov Num, eax
	call Crlf

	cmp eax, 0
	jne ciclo

	exit

ciclo:
	mov edx, OFFSET Mensaje2
	call WriteString
	call ReadInt
	mov Num, eax
	call Crlf

	cmp eax, 0
	jne ciclo   

	exit         
main ENDP
END main