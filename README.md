<p align="center">
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/main/badges/libftm.png" alt="libft badge"/>
</p>

<h1 align="center">libft</h1>

<p align="center">
  <b><i>Minha própria biblioteca de funções em C — projeto da 42 São Paulo.</i></b>
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/main/badges/ft_printfm.png" alt="ft_printf badge" height="100"/>
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/main/badges/get_next_linem.png" alt="get_next_line badge" height="100"/>
</p>

---

## 📖 Sobre

A **libft** é o primeiro projeto do Common Core da 42. O objetivo é reimplementar funções da `libc` e criar funções utilitárias extras que serão reaproveitadas nos próximos projetos.

Esta versão também incorpora o **ft_printf** e o **get_next_line**, além de algumas funções adicionais criadas ao longo do curso.

## 📁 Estrutura

```
libft/
├── include/
│   └── libft.h
├── src/
│   ├── ctype/    # classificação e conversão de caracteres
│   ├── mem/      # manipulação de memória
│   ├── str/      # manipulação de strings
│   ├── conv/     # conversões numéricas
│   ├── put/      # escrita em file descriptors
│   ├── lst/      # listas encadeadas (bônus)
│   ├── printf/   # ft_printf
│   └── gnl/      # get_next_line
└── Makefile
```

## 🧩 Funções

### `ctype/`
| Função | Descrição |
| :-- | :-- |
| `ft_isalpha` | Verifica se é letra |
| `ft_isdigit` | Verifica se é dígito |
| `ft_isalnum` | Verifica se é letra ou dígito |
| `ft_isascii` | Verifica se é ASCII |
| `ft_isprint` | Verifica se é imprimível |
| `ft_toupper` | Converte para maiúscula |
| `ft_tolower` | Converte para minúscula |

### `mem/`
| Função | Descrição |
| :-- | :-- |
| `ft_memset` | Preenche memória com um byte |
| `ft_bzero` | Zera uma área de memória |
| `ft_memcpy` | Copia memória |
| `ft_memmove` | Copia memória com sobreposição segura |
| `ft_memchr` | Procura um byte na memória |
| `ft_memcmp` | Compara duas áreas de memória |
| `ft_calloc` | Aloca e zera memória |

### `str/`
| Função | Descrição |
| :-- | :-- |
| `ft_strlen` | Tamanho da string |
| `ft_strlcpy` / `ft_strlcat` | Cópia / concatenação com limite |
| `ft_strchr` / `ft_strrchr` | Primeira / última ocorrência de um caractere |
| `ft_strcmp` / `ft_strncmp` | Comparação de strings |
| `ft_strnstr` | Procura substring com limite |
| `ft_strdup` | Duplica uma string |
| `ft_substr` | Extrai substring |
| `ft_strjoin` | Concatena duas strings (nova alocação) |
| `ft_strjoin3` | Concatena três strings (nova alocação) |
| `ft_strtrim` | Remove caracteres das pontas |
| `ft_split` | Divide string por delimitador |
| `ft_strmapi` / `ft_striteri` | Aplica função a cada caractere |
| `ft_free_array` | Libera um array de strings |

### `conv/`
| Função | Descrição |
| :-- | :-- |
| `ft_atoi` | String → `int` |
| `ft_atol` | String → `long` |
| `ft_itoa` | `int` → string |

### `put/`
| Função | Descrição |
| :-- | :-- |
| `ft_putchar_fd` | Escreve um caractere |
| `ft_putstr_fd` | Escreve uma string |
| `ft_putendl_fd` | Escreve uma string + `\n` |
| `ft_putnbr_fd` | Escreve um número |

### `lst/` (bônus)
| Função | Descrição |
| :-- | :-- |
| `ft_lstnew` | Cria um nó |
| `ft_lstadd_front` / `ft_lstadd_back` | Adiciona no início / fim |
| `ft_lstsize` | Quantidade de nós |
| `ft_lstlast` | Último nó |
| `ft_lstdelone` / `ft_lstclear` | Remove um nó / a lista inteira |
| `ft_lstiter` / `ft_lstmap` | Itera / mapeia a lista |
| `ft_lst_to_array` | Converte a lista em array |

### `printf/` — ft_printf
Reimplementação do `printf` com suporte às conversões `%c`, `%s`, `%p`, `%d`, `%i`, `%u`, `%x`, `%X` e `%%`.

### `gnl/` — get_next_line
Lê um arquivo linha por linha a partir de um file descriptor. Inclui `ft_gnl_trim` como utilitário extra.

## 🛠️ Compilação

```bash
make        # gera libft.a
make clean  # remove os objetos
make fclean # remove objetos e libft.a
make re     # recompila do zero
```

## 🚀 Uso

```c
#include "libft.h"

int	main(void)
{
	ft_printf("Olá, %s!\n", "42");
	return (0);
}
```

```bash
cc -Wall -Wextra -Werror main.c -Iinclude -L. -lft
```

---

<p align="center">Feito por <a href="https://github.com/Soppinha">svaladar</a> · 42 São Paulo</p>
