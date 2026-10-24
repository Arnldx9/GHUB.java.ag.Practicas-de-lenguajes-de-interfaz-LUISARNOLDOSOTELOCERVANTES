; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: 10:00 - 11:00 ; Docente: Dr. José Luis Medina Jiménez ; Práctica: 7. Validación de formato ; Descripción: Valida que una cadena ingresada cumpla con un formato específico mediante rangos ASCII.
INCLUDE Irvine32.inc

.data
    prompt   BYTE "Ingrese codigo (Ej. ABC-123): ", 0
    msgExito BYTE "Cadena VALIDA.", 0
    msgError BYTE "Cadena INVALIDA.", 0
    
    buffer   BYTE 20 DUP(0)  ; Buufer para guardar lo ingresado

.code
main PROC
    ; --- 1. LEER LA CADENA ---
    mov edx, OFFSET prompt
    call WriteString

    mov edx, OFFSET buffer   ; EDX apunta al buffer de entrada
    mov ecx, LENGTHOF buffer ; ECX = maximo de caracteres permitidos
    call ReadString          ; Llama a la macro; EAX guardará la longitud ingresada
    
    ; --- 2. VALIDAR LA LONGITUD ---
    cmp eax, 7               ; Compara si el tamaño en EAX es exactamente 7
    jne cadena_invalida      ; Si no es igual a 7, salta directo a error

    ; --- PREPARAR PUNTERO ---
    mov esi, OFFSET buffer   ; ESI funcionara como puntero (índice) para recorrer la cadena

    ; --- 3. VALIDAR PRIMEROS 3 ESPACIOS (LETRAS A-Z MAYÚSCULAS) ---
    mov ecx, 3               ; Se configura el contador del ciclo (LOOP) para 3 iteraciones

valida_letras:
    mov al, [esi]            ; Extrae el caracter actual al que apunta ESI
    cmp al, 'A'              ; Verifica el límite inferior del rango ASCII ('A')
    jb cadena_invalida       ; Si es menor (Jump if Below), es inválido
    cmp al, 'Z'              ; Verifica el limite superior del rango ASCII ('Z')
    ja cadena_invalida       ; Si es mayor (Jump if Above), es invalido
    inc esi                  ; Mueve el puntero a la siguiente posición de la cadena
    loop valida_letras       ; Resta 1 a ECX. Si ECX > 0, repite 'valida_letras'

    ; 4. VALIDAR EL GUIIN (-) EN LA POSICIÓN 4 
    ; Como el bucle anterior avanzó ESI tres veces, ya apunta al cuarto espacio
    mov al, [esi]            
    cmp al, '-'              ; Compara el caracter actual con un guión
    jne cadena_invalida      ; Si no es un guión, es inválido
    inc esi                  ; Mueve el puntero al siguiente espacio (primer digito)

    ; 5. VALIDAR uLTIMOS 3 ESPACIOS (DIGITOS 0-9) 
    mov ecx, 3               ; Se configura nuevamente el contador para 3 iteraciones

valida_digitos:
    mov al, [esi]            
    cmp al, '0'              ; Verifica el limite inferior del rango numerico
    jb cadena_invalida       ; Si es menor a '0', inválido
    cmp al, '9'              ; Verifica el limite superior del rango numérico
    ja cadena_invalida       ; Si es mayor a '9', invalido
    inc esi                  ; Avanza al siguiente caracter
    loop valida_digitos      

    ; --- ÉXITO: TODAS LAS CONDICIONES SE CUMPLIERON ---
    mov edx, OFFSET msgExito
    call WriteString
    jmp fin                  ; Salta al final para ignorar el mensaje de error

cadena_invalida:
    mov edx, OFFSET msgError
    call WriteString

fin:
    call Crlf
    exit
main ENDP
END main