; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 1. Ciclos numéricos ; Descripción: Imprime números iterativamente en consola usando la instrucción loop.
INCLUDE Irvine32.inc 

.code
main PROC
	mov ecx, 5
ciclo:
	mov eax, ecx
	call WriteDec 
	call Crlf   
	loop ciclo
	exit
main ENDP
END main