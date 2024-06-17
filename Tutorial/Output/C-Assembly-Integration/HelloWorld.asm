; We import the standard libraries from Microsoft Visual C (MSVC)
includelib ucrt.lib ; Universal C Runtime, provides standard C runtime functions
includelib legacy_stdio_definitions.lib ; Definitions for standard C stdio library functions

; We import the operating system libraries
includelib kernel32.lib ; Standard library for operating system interactions

extern printf: proc ; We declare that printf is an external function from the imported C libraries
extern ExitProcess: proc ; We declare that ExitProcess is an external function from kernel32
                         ; It allows us to return control to the operating system once the program has finished

.data ; Our data section
  ; We declare a storage space in the following format:
  ; name + stack + data or reserve for later use
  msg db "Hello, World!", 0 ; The zero indicates that the message ends at the last character

.code ; Our code section
  ; The main function is called main
  main proc ; Start of the function
    ; In x64 assembly, 'proc' starts a procedure definition and 'endp' ends it.

    sub rsp, 32 ; We reserve 32 bytes on the stack for local variables or function calls.
                ; This space can be used for saving registers or local data.

      mov rcx, offset msg ; We pass rcx as the first argument to printf.
                          ; In x64 calling convention, the first four arguments are passed via registers RCX, RDX, R8, and R9.
                          ; The 'offset' keyword is used to get the memory address of 'msg'.
                          ; The data stored in 'msg' is moved to the rcx register.

      call printf         ; We call printf to print our message.
                          ; 'call' is used to invoke a procedure or function.

    add rsp, 32 ; We release the 32 bytes reserved on the stack.
                ; It's important to clean up and maintain stack balance.

    xor rcx, rcx ; We indicate that we are exiting the program with a return code of 0.
                 ; 'xor' with itself is a common way to set a register to zero.

    call ExitProcess ; We exit the program, returning control to the operating system.
                     ; This ensures a clean exit without leaving any processes hanging.
  main endp ; End of the function
end ; End of file
