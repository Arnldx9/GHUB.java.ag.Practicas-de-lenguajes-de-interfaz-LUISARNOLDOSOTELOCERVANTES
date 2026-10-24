; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 2. Captura y desplegado de mensajes ; Descripción: Solicita al usuario ingresar una cadena de texto y la despliega en pantalla.
INCLUDE Irvine32.inc 

.data
	mensajeBienvenida BYTE "Ingresa una cadena: ",0
	palabra BYTE 20 DUP(0)
.code
main PROC
	mov edx, OFFSET mensajeBienvenida
	call WriteString

	mov edx, OFFSET palabra
	mov ecx, SIZEOF palabra

	call ReadString
	call Crlf

	mov edx, OFFSET palabra
	call WriteString
	call Crlf
	
	exit
main ENDP
END main