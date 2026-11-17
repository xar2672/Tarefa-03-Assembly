
; Esqueleto NASM x86-64 Linux

global _start

section .data
    msg_entrada db "Digite o nome do arquivo de entrada: ", 0
    msg_saida   db "Digite o nome do arquivo de saída: ", 0

section .bss
    nome_entrada resb 256
    nome_saida   resb 256
    byte_arq     resb 1
    buffer_hex   resb 16
    descr_entrada resq 1
    descr_saida   resq 1
    code_point    resq 1

section .text

_start:

    ;printf teste para o nasm
    mov rax, 1
    mov rdi, 1
    mov rsi, m1
    mov rdx, tamanho
    syscall
    ;stdin
    mov rax, 0              ; sys_read
    mov rdi, 0              ; stdin
    lea rsi, [bit] 
    mov rdx, 256 
    syscall
    mov r12, rax

    ; write(1, buffer, bytes_read)
    mov rax, 1 
    mov rdi, 1 
    lea rsi, [bit]
    mov rdx, r12
    syscall


    EXIT: 
    mov rax,60
    mov rdi, 0
    syscall


;os parametros esperados na pilha são (char* nome_arquivo, int modo_abertura) passados em rsi e rdi
    abre_arquivo:
    mov rax, 2  ;syscall open
    mov rdi, 'arquivo'
    mov rsi, 0 ; modo somente leitura
    cmp rax, 0 ; verificação de erros
    jl EXIT
    ret

;os parametros esperados na pilha são (int descritor_arquivo, char* byte_arq) passados em rsi e rdi
    le_byte_arquivo:
    mov rax, 0          ; syscall read
    mov rdx, 1          ; ler apenas 1 byte
    syscall             ; rdi e rsi já estão corretos
    ret

;o parametro esperados na pilha é (int descritor_arquivo) passado em rsi 
    fecha_arquivo:
    mov rax, 3
    mov rdi, 12
    syscall
    ret

;os parametros esperados na pilha são (char* buffer, int tam_max) passados em rsi e rdi
    le_string:
    ret

;o parametro esperado na pilha é (char* buffer) passado em rsi
    escreve_string:
    ret
    
 
;os parametros esperados na pilha são (int descritor_arquivo, char* buffer) passados em rsi e rdi
    grava_string_arquivo:
    ret
;os parametros esperados na pilha são (int valor, char* buffer) passados em rsi e rdi
    gera_string_hexadecimal:
    ret
    ; TODO: solicitar e ler nome do arquivo de entrada
    ; TODO: solicitar e ler nome do arquivo de saída
    ; TODO: abrir arquivos usando abre_arquivo
    ; TODO: loop de leitura byte a byte
    ; TODO: determinar se a sequência UTF-8 possui 1, 2, 3 ou 4 bytes
    ; TODO: combinar bits para reconstruir o code point
    ; TODO: chamar gera_string_hexadecimal e grava_string_arquivo
    ; TODO: fechar os arquivos e encerrar com sys_exit
    jmp fim_programa

