; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 14. Captura y almacenamiento de datos numéricos ; Descripción: Captura un ciclo de 5 números ingresados por el usuario y los guarda consecutivamente en un arreglo de tipo DWORD.
INCLUDE Irvine32.inc

.data
    arreglo     DWORD 5 DUP(?)          ; Arreglo reservado en memoria para 5 nmeros
    msgIngreso  BYTE "Ingrese un numero (faltan ", 0
    msgCierre   BYTE "): ", 0
    msgExito    BYTE "Los datos fueron capturados y almacenados en el arreglo correctamente.", 0

.code
main PROC
    mov ecx, 5                  ; Configurar el contador para leer 5 nemeros
    mov esi, OFFSET arreglo     ; ESI servira como puntero base al arreglo

Captura:
    ; Imprimir mensaje dinamico indicando cuántos faltan
    mov edx, OFFSET msgIngreso
    call WriteString
    mov eax, ecx                
    call WriteDec               
    mov edx, OFFSET msgCierre
    call WriteString

    ; Leer el número y almacenarlo
    call ReadInt                ; Lee el entero y lo guarda en EAX
    mov [esi], eax              ; Mueve el valor de EAX al espacio de memoria del arreglo
    add esi, 4                  ; Avanza el puntero 4 bytes (tamaño de un DWORD) al siguiente espacio

    loop Captura                ; Decrementa ECX y repite si no es 0

    call Crlf
    mov edx, OFFSET msgExito
    call WriteString
    call Crlf

    exit
main ENDP
END main