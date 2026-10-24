; Materia: Lenguajes de Interfaz ; Alumno: Luis Arnoldo Cervantes ; Horario: [10-11] ; Docente: Dr. José Luis Medina Jiménez ; 
INCLUDE Irvine32.inc

.data
    nombreArchivo    BYTE "archivo_practica15.txt", 0
    textoEscribir    BYTE "Holaaa. Esta es una manipulacion de archivos exitosa desde Ensamblador (Practica 15).", 0
    manejadorArchivo HANDLE ?
    msgExito         BYTE "Exito: Se ha creado el archivo 'archivo_practica15.txt' y se ha escrito en el.", 0
    msgError         BYTE "Error: No se pudo crear el archivo.", 0

.code
main PROC
    ; 1. Crear el archivo (CreateOutputFile)
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile
    cmp eax, INVALID_HANDLE_VALUE   ; Verifica si hubo un error al crear
    je ErrorArchivo
    mov manejadorArchivo, eax       ; Guardamos el Handle (identificador) del archivo

    ; 2. Escribir texto en el archivo (WriteToFile)
    mov eax, manejadorArchivo
    mov edx, OFFSET textoEscribir
    mov ecx, LENGTHOF textoEscribir - 1 ; Tomar el largo sin el carácter nulo final
    call WriteToFile

    ; 3. Cerrar el archivo para liberar memoria (CloseFile)
    mov eax, manejadorArchivo
    call CloseFile

    ; Notificar éxito en consola
    mov edx, OFFSET msgExito
    call WriteString
    call Crlf
    jmp Fin

ErrorArchivo:
    mov edx, OFFSET msgError
    call WriteString
    call Crlf

Fin:
    exit
main ENDP
END main