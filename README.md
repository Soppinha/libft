*This project has been created as part of the 42 curriculum by svaladar.*

<p align="center">
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/main/badges/libftm.png" alt="libft badge"/>
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/main/badges/ft_printfm.png" alt="ft_printf badge"/>
  <img src="https://raw.githubusercontent.com/ayogun/42-project-badges/main/badges/get_next_linem.png" alt="get_next_line badge"/>
</p>

# libft

## Description

`libft` is the first project of the 42 Common Core: a static C library that reimplements part of the `libc` and adds utility functions. Later projects reuse it, so it grows with the curriculum.

This version also bundles two other 42 projects as **git submodules**, so one `libft.a` and one `#include "libft.h"` give you everything:

- [**ft_printf**](https://github.com/Soppinha/ft_printf): `printf` with `%c %s %p %d %i %u %x %X %%` and the `-0.# +` flags, width and precision.
- [**get_next_line**](https://github.com/Soppinha/GNL): reads a file descriptor one line at a time. The bonus version is used, so it can read from several file descriptors at once.

### Structure

```
libft/
├── include/
│   └── libft.h      # every public prototype, including ft_printf and get_next_line
├── src/
│   ├── ctype/       # character tests and conversions
│   ├── mem/         # memory manipulation
│   ├── str/         # string manipulation
│   ├── conv/        # number <-> string conversions
│   ├── put/         # writing to file descriptors
│   ├── lst/         # linked lists
│   ├── ft_printf/   # submodule: github.com/Soppinha/ft_printf
│   └── gnl/         # submodule: github.com/Soppinha/GNL
└── Makefile         # objects are built in obj/
```

### How the submodules are built

ft_printf and get_next_line live in their own repositories and **do not depend on libft**. If they did, libft and the projects would depend on each other in a circle. The libft `Makefile`:

1. runs `git submodule update --init` if a submodule folder is empty,
2. calls `make` in `src/ft_printf` and `make bonus` in `src/gnl`. Each one is rebuilt only when its sources change,
3. archives their objects together with libft's own objects into `libft.a`.

`libft.h` declares only the public functions (`ft_printf`, `get_next_line`). Their helpers stay private to each submodule.

### Functions

#### `ctype/`
| Function | Description |
| :-- | :-- |
| `ft_isalpha` | Checks for a letter |
| `ft_isdigit` | Checks for a digit |
| `ft_isalnum` | Checks for a letter or digit |
| `ft_isascii` | Checks for an ASCII character |
| `ft_isprint` | Checks for a printable character |
| `ft_toupper` / `ft_tolower` | Converts to upper / lower case |

#### `mem/`
| Function | Description |
| :-- | :-- |
| `ft_memset` | Fills memory with a byte |
| `ft_bzero` | Zeroes a memory area |
| `ft_memcpy` | Copies memory |
| `ft_memmove` | Copies memory, safe when the areas overlap |
| `ft_memchr` | Finds a byte in memory |
| `ft_memcmp` | Compares two memory areas |
| `ft_calloc` | Allocates zeroed memory |

#### `str/`
| Function | Description |
| :-- | :-- |
| `ft_strlen` | String length |
| `ft_strlcpy` / `ft_strlcat` | Size-bounded copy / concatenation |
| `ft_strchr` / `ft_strrchr` | First / last occurrence of a character |
| `ft_strcmp` / `ft_strncmp` | String comparison |
| `ft_strnstr` | Finds a substring within a length |
| `ft_strdup` | Duplicates a string |
| `ft_substr` | Extracts a substring |
| `ft_strjoin` / `ft_strjoin3` | Joins two / three strings into a new one |
| `ft_strtrim` | Trims a set of characters from both ends |
| `ft_split` | Splits a string on a delimiter |
| `ft_strmapi` / `ft_striteri` | Applies a function to each character |
| `ft_free_array` | Frees a `NULL`-terminated array of strings |
| `ft_gnl_trim` | Reads the next line with `get_next_line` and removes the trailing `\n` |

#### `conv/`
| Function | Description |
| :-- | :-- |
| `ft_atoi` / `ft_atol` | String to `int` / `long` |
| `ft_itoa` | `int` to string |

#### `put/`
| Function | Description |
| :-- | :-- |
| `ft_putchar_fd` | Writes a character |
| `ft_putstr_fd` | Writes a string |
| `ft_putendl_fd` | Writes a string followed by `\n` |
| `ft_putnbr_fd` | Writes an integer |

#### `lst/`
| Function | Description |
| :-- | :-- |
| `ft_lstnew` | Creates a node |
| `ft_lstadd_front` / `ft_lstadd_back` | Adds a node at the start / end |
| `ft_lstsize` | Number of nodes |
| `ft_lstlast` | Last node |
| `ft_lstdelone` / `ft_lstclear` | Deletes one node / the whole list |
| `ft_lstiter` / `ft_lstmap` | Iterates over / maps the list |
| `ft_lst_to_array` | Converts the list into an array |

#### Submodules
| Function | Description |
| :-- | :-- |
| `ft_printf` | Formatted output to stdout, returns the number of characters written |
| `get_next_line` | Returns the next line of a file descriptor (with its `\n`), or `NULL` at the end |

## Instructions

### Cloning

```bash
git clone --recurse-submodules https://github.com/Soppinha/libft.git
# or, in an existing clone:
git submodule update --init
```

If the submodules were not cloned, `make` fetches them automatically.

### Compilation

```bash
make          # builds libft.a, including ft_printf and get_next_line
make bonus    # same as make: the list functions are always included
make clean    # removes the object files (libft and submodules)
make fclean   # also removes libft.a
make re       # rebuilds everything
```

The output uses the same format in all my projects, with one line per step:

```
[ft_printf]  archived   libftprintf.a
[gnl]        archived   libgnl.a (bonus)
[libft]      archived   libft.a
```

### Usage

```c
#include <fcntl.h>
#include "libft.h"

int	main(void)
{
	int		fd;
	char	*line;

	fd = open("file.txt", O_RDONLY);
	line = get_next_line(fd);
	while (line)
	{
		ft_printf("%-10s| %s", "line:", line);
		free(line);
		line = get_next_line(fd);
	}
	close(fd);
	return (0);
}
```

```bash
cc -Wall -Wextra -Werror main.c -Iinclude -L. -lft -o example
```

As a submodule of another project, add `-Ilibft/include -Llibft -lft` and call `make -C libft` before linking.

## Resources

- `man 3 ctype`, `man 3 string`, `man 3 printf`, `man 2 read`
- [Git submodules – Pro Git book](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
- [GNU Make manual](https://www.gnu.org/software/make/manual/make.html)
- [Tripouille/libftTester](https://github.com/Tripouille/libftTester), a tester for this project

### AI usage

AI was used to draft this README from the existing source code. The implementation was written by the author.
