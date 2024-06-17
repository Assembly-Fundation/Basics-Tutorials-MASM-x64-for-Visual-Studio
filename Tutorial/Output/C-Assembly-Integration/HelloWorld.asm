; Importamos las bibliotecas estandar de Microsoft Visual C (MSVC)
includelib ucrt.lib ; Universal C Runtime
includelib legacy_stdio_definitions.lib ; Definición de las funciones de la biblioteca estandar de C stdio

; Importamos las bibliotecas del sistema operativo
includelib kernel32.lib ; Biblioteca estandar para entrada y salida de datos

extern printf: proc ; Declaramos que printf es una función externa perteneciente a las bibliotecas de C importadas
extern ExitProcess: proc ; Declaramos que ExitProcess es una función externa perteneciente a kernel32
                         ; Sirve que una vez terminado el programa, podamos devolver el control al sistema operativo

.data ; Nuestra sección de datos
  ; Declaramos un espacio de almacenamiento de la siguiente forma
  ; name + stack + data or reserve
  msg db "Hello, Wolrd!", 0

.code ; Nuestra sección de código
  ; La función principal se llama main
  main proc ; Inicio de la función
    sub rsp, 32
    add rsp, 32
    xor
  main endp ; Fin de la función
end ; fin del archivo
