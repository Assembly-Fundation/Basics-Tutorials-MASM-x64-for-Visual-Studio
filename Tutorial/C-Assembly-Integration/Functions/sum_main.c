// Include the standard C library `stdio`
#include <stdio.h>

// To use functions written in assembly, we must declare them as external and of type __fastcall
extern int __fastcall sum(int a, int b);

// Note that doing this is only possible if you have the `.asm` file in the same directory

// Start of our program

int main() {
  int result = sum(10, 20);
  printf("%d", result);
  return 0;
}

/*
  Typically, basic and direct operations like `10 + 20` are handled by the compiler.
  When we look at the generated code, we only see that the value of the sum is stored in a "variable".
  The translation would look something like this in assembly pseudocode.

  ``` asm
  import_library stdio
  
  extern printf
  
  section .data
    result qword ?
    message qword "%d", 0
    
  section .code
    main: ; start_process
      mov rcx, message
      mov [result], number
      call printf
      ; Exit program
    main: ; finish_process
    ```
    
    This is how the compiler's translation looks.
    It is more efficient because everything is calculated at compile time.
    In simple terms, the operation is done before being translated to machine code.

    Even though our function is less efficient, in specific cases it can be much more efficient.

    Here is an example where assembly is more efficient than C.

    ``` C
    int sum(int a, int b) {
      return a + b;
    }
    ```

  As we can see, this C function is in its most efficient form, but it is less efficient than our function.
  The code generated by this C function is as follows in assembly pseudocode.
  
  ``` asm
    sum start_process
     push   rbp
     mov    rbp,rsp
     mov    DWORD PTR [rbp-0x4],rdi
     mov    DWORD PTR [rbp-0x8],rsi
     mov    rdx,DWORD PTR [rbp-0x4]
     mov    rax,DWORD PTR [rbp-0x8]
     add    rax,rdx
     pop    rbp
     ret
    sum finish_process
  ```
  
  This pseudocode doesn't apply in all cases, but it gives us an idea of what the compiler does.
  While that code is quite large, our function is very simple.
  
  ``` asm
    sum start_process
      add rcx, rdx
      mov rax, rcx
      ret
    sum finish_process
  ```

  However, we shouldn't be too confident, as assembly instructions have different weights and efficiencies.
  The `add` instruction is more efficient than the `mov` instruction.
  When C performs the addition in this part:

  ``` asm
  mov    DWORD PTR [rbp-0x4],rdi
  mov    DWORD PTR [rbp-0x8],rsi
  mov    rdx,DWORD PTR [rbp-0x4]
  mov    rax,DWORD PTR [rbp-0x8]
  add    rax,rdx
  ```

  We can see that it uses `mov` four times before adding.

  In our case, we add directly, move the value to the `rax` register, and then return the value in `rax`.
  
  In almost any case, if there is an addition in a function involving its parameters, it will be more efficient to use a `__fastcall` function written in assembly than doing it directly in C.
*/
