Ajudar a Copiar >> ✅ ⚠️ ⛔/🚫
# Tarefa-03-Assembly
# Decodificador UTF-8 em Assembly (NASM x86-64)

> **Objetivo:** Criar um programa em Assembly NASM (Linux 64 bits) que lê um arquivo de texto em **UTF-8**, extrai o code point Unicode de cada caractere (de 1 a 4 bytes) e grava o valor correspondente em **hexadecimal maiúsculo** (um por linha) em um arquivo de saída.

### Exemplo Prático
Se `entrada.txt` contiver `ABç` seguido de uma quebra de linha (`LF`). Por exemplo:

| Caractere | Bytes UTF-8 (Hex) | Code Point | Linha gerada na saída |
| `A` | `41` (1 byte) | `U+0041` | `0x41` |
| `\n` (LF) | `0A` (1 byte) | `U+000A` | `0xA` |

> **Atenção:**
> -- Quebras de linha (`0x0A`) **devem** ser processadas e gerar `0xA` na saída;
> -- Use prefixo `0x` minúsculo e dígitos hexadecimais **MAIÚSCULOS** (`0x1F60E`, nunca `0x1f60e` ou `0x0041`);
> -- **Nunca** grave o caractere terminador `NUL` (`0x00`) no arquivo de saída.

---

## 1. Fluxo Completo do Programa

1. Exibir mensagem e ler o **nome do arquivo de entrada** (`escreve_string` + `le_string`);
2. Exibir mensagem e ler o **nome do arquivo de saída** (`escreve_string` + `le_string`);
3. Abrir arquivo de entrada para leitura (`abre_arquivo` com modo `0`);
4. Criar/sobrescrever arquivo de saída (`abre_arquivo` com modo `577`);

**Início do Loop:**
5. Ler 1 byte do arquivo de entrada (`le_byte_arquivo`);
6. Se `RAX == 0` (EOF), sair do loop e ir para o **Passo 12**;
7. Analisar os bits mais significativos do 1º byte para descobrir o tamanho `N` (`1`, `2`, `3` ou `4`);
8. Se `N > 1`, ler os `N - 1` bytes de continuação (`le_byte_arquivo`);
9. Extrair os bits úteis (`x`) e montar o inteiro do code point via deslocamentos (`shl`) e `or`;
10. Converter o inteiro para string hexadecimal terminada em `LF` + `NUL` (`gera_string_hexadecimal`);
11. Gravar a string no arquivo de saída, incluindo `LF` mas _sem_ `NUL` (`grava_string_arquivo`), e voltar ao **Passo 5**;
12. Fechar os dois arquivos (`fecha_arquivo`) e encerrar o programa (`sys_exit`).

---

## 2. Contrato das Funções Obrigatórias

### Convenção de Chamada (Crítico!)
- **Arquitetura:** NASM Linux x86-64.
- **Passagem de parâmetros:** **Todos pela PILHA** (cada parâmetro ocupa **8 bytes / 64 bits**).
- **Retorno:** Sempre no registrador `RAX` (quando houver retorno).
- **Syscalls Linux x86-64:** `sys_read = 0`, `sys_write = 1`, `sys_open = 2`, `sys_close = 3`, `sys_exit = 60`.

### Tabela de Funções ESTÁ NO EDISCIPLINAS



---

## 3. Como Compilar, Executar e Testar

**Não sei, precisa-se definir aqui

**Sobre a questão dos testes, TODO: ANALISAR O .pdf syllabus do EP3 para ver qual decisão tomar para o teste

---







Ajudar a Copiar >> ✅ ⚠️ ⛔/🚫
## 4. Checklist de Desenvolvimento e Entrega

### Etapa 1: Estrutura e I/O Básico
- [ ✅ ] Configurar repositório **Git** (commits frequentes e individuais de todos os membros);
- [ 🚫 ] Criar `Makefile` para automatizar `nasm` e `ld`;
- [ ] Implementar e testar `escreve_string` e `le_string` (lembrando de remover o `\n` antes do `\0`).
- [ ] Implementar e testar `abre_arquivo`, `fecha_arquivo`, `le_byte_arquivo` e `grava_string_arquivo`.

### Etapa 2: Lógica de Conversão e UTF-8
- [ ] Implementar `gera_string_hexadecimal` e testar casos de borda (`0x0`, `0xA`, `0x41`, `0x1F60E`);
- [ ] Implementar a detecção de tamanho UTF-8 (`1`, `2`, `3` ou `4` bytes) e extração/união dos bits;
- [ ] Integrar o loop principal lendo até `le_byte_arquivo` retornar `0` (EOF).

### Etapa 3: Validação e Pacote Final (e-Disciplinas)
- [ ] Validar os 3 testes oficiais com `diff` (saída deve ser vazia);
- [ ] Revisar comentários e organização do código (`tarefa3-Grupo7.asm`);
- [ ] Escrever relatório curto (testes realizados, dificuldades e contribuição de cada integrante);
- [ ] Compactar o repositório: o repositório deverá ser entregue junto com os demais arquivos, por meio do edisciplinas, e como arquivo
compactado contendo a pasta .git.




