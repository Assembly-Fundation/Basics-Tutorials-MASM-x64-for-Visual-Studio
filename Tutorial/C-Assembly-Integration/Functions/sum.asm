; The following tutorial is an explanation of the concept of functions in MASM x64 with integration on C
; Functions in MASM x64 are quite straightforward and easy to understand.
; A function has the format `name_function proc /* process */ name_function endp`
; The mnemonic `proc` stands for "process" and indicates the start of the function
; The mnemonic `endp` stands for "end of process" and indicates the end of the function
; Everything that comes after `proc` and before `endp` in the `.code` section is part of the function
; Functions in MASM x64 use the __fastcall convention
; Here's an example:

.code ; Code section
  sum proc ; We start the function definition
    add rcx, rdx ; We add the numbers in rcx and rdx to store the result in rcx
                 ; The expression would be `rcx = rcx + rdx`
    mov rax, rcx ; We store the result from rcx into rax
                 ; According to the __fastcall convention, the result is returned in the rax register
                 ; That's why we store the result from rcx into rax
    ret ; We return the value in rax
  sum endp ; We end the function definition

end ; End of file
