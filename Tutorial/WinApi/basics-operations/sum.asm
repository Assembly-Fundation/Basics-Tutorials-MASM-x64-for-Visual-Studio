; The following tutorial is only an explanation of the concept of addition in MASM x64
; The addition instruction uses the mnemonic `add`
; `add register1, register2` or `add register, number`
; The corresponding expression is `register1 = register1 + register2` or `register = register + number`
; Here's an example:

add rcx, rdx ; rcx = rcx + rdx
             ; This expression corresponds to `register1 = register1 + register2`
             ; It adds the value in rdx to rcx and stores the result in rcx.

add rcx, 10 ; rcx = rcx + 10
            ; This expression corresponds to `register = register + number`
            ; It adds the number 10 to the value in rcx and stores the result in rcx.
