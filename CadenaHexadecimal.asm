; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 13. Obtención de una cadena hexadecimal ; Descripción: Convierte un número numérico a una cadena de caracteres en formato hexadecimal mediante máscaras y corrimientos.
INCLUDE Irvine32.inc

.data
    numero      DWORD 255               ; Nuumero de prueba (FF en hexadecimal)
    cadenaHex   BYTE 9 DUP(0)           ; Buffer para 8 caracteres + caracter nulo
    msgSalida   BYTE "El numero convertido a hexadecimal es: ", 0

.code
main PROC
    mov eax, numero
    mov esi, OFFSET cadenaHex
    mov ecx, 8                  ; 8 nibbles (medios bytes) en un registro de 32 bits

CicloHex:
    rol eax, 4                  ; Rotar 4 bits a la izquierda para extraer el nibble más significativo
    mov bl, al
    and bl, 0Fh                 ; Enmascarar para quedarse solo con los 4 bits bajos
    
    cmp bl, 9
    ja LetraHex                 ; Si es mayor a 9, es una letra (A-F)
    add bl, '0'                 ; Si es 0-9, convertir a carcter ASCII numerico
    jmp GuardarChar

LetraHex:
    add bl, 'A' - 10            ; Convertir valor (10-15) a letras ASCII ('A'-'F')

GuardarChar:
    mov [esi], bl               ; Guardar el caracter en el buffer
    inc esi                     ; Avanzar puntero de la cadena
    loop CicloHex               ; Repetir para los 8 caracteres

    mov byte ptr [esi], 0       ; Agregar terminador nulo al final de la cadena

    ; Imprimir resultados
    mov edx, OFFSET msgSalida
    call WriteString
    mov edx, OFFSET cadenaHex
    call WriteString
    call Crlf

    exit
main ENDP
END main