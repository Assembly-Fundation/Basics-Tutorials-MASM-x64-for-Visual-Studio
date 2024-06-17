; Include system libraries
includelib kernel32.lib

; Declare the functions as externs from the kernel32 library
extern WriteConsoleA: proc ; This function writes a block of characters to the console,
                           ; i.e., the text output.
                           ; It is used to display text to the user.
                           
extern GetStdHandle: proc ; Retrieves a handle for a standard input or output device (STDIN, STDOUT, STDERR).
                          ; For example, you can get the output console handle to use with WriteConsoleA.
                          
extern ExitProcess: proc ; Terminates the current process and returns an exit code.
                         ; It hands control back to the operating system.

; Declare our data section
.data
  ; Declare our memory address where our data will be stored
  ; The following structure is used for declaration:
  ; Identifier + size of reservation + what will be stored
  msg db "Hello World", 0 ; The '0' at the end indicates the end of our text string (null-terminated)

  stdout qword ? ; Reserve 64 bits for later use
  nBytesWritten qword ? ; Reserve another 64 bits for later use

; Declare our code section
.code
  ; Declare the main function.
  ; The name of the function is optional, but generally called start or main
    main proc ; Start of the main function
      sub rsp, 32         ; Reserve 32 bytes of stack space
      
	      mov rcx, -11      ; rcx represents the first argument for GetStdHandle
                          ; Move -11 into rcx (STD_OUTPUT_HANDLE)
                          
	      call GetStdHandle ; Call GetStdHandle function
                          ; Since rcx had -11 as value,
                          ; The result of the function is stored in rax
                          
	      mov stdout, rax   ; Store the value of rax in stdout
      add rsp, 32         ; Free up the stack space by resetting rsp to its original value

      sub rsp, 32             ; Reserve 32 bytes of stack space again
	      mov rcx, stdout       ; Move the value of stdout into rcx
	      lea rdx, msg          ; Load the address of msg into rdx
	      mov r8, lengthof msg  ; Count the size of msg and store it in r8
	      lea r9, nBytesWritten ; Load the address of nBytesWritten into r9
	      call WriteConsoleA    ; Call WriteConsoleA to print the message
      add rsp, 32             ; Free up the stack space by resetting rsp to its original value

      mov rcx, 0       ; Indicate that the program finished successfully with exit code 0
      call ExitProcess ; Tell the system that we're done and hand back control
    main endp          ; End of the main function

end                     ; End of assembly file
