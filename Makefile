NAME		=	libft.a
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
INCLUDES	=	-Iinclude
RM			=	rm -rf

SRC_DIR		=	src
OBJ_DIR		=	obj

CTYPE		=	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c \
				ft_isprint.c ft_toupper.c ft_tolower.c

MEM			=	ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
				ft_memchr.c ft_memcmp.c ft_calloc.c

STR			=	ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c \
				ft_strrchr.c ft_strcmp.c ft_strncmp.c ft_strnstr.c \
				ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c \
				ft_split.c ft_strmapi.c ft_striteri.c \
				ft_strjoin3.c ft_free_array.c

CONV		=	ft_atoi.c ft_atol.c ft_itoa.c

PUT			=	ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

LST			=	ft_lstnew_bonus.c ft_lstadd_front_bonus.c \
				ft_lstadd_back_bonus.c ft_lstsize_bonus.c \
				ft_lstlast_bonus.c ft_lstdelone_bonus.c \
				ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c \
				ft_lst_to_array.c

PRINTF		=	ft_printf.c ft_parse_format.c ft_print_char.c \
				ft_print_str.c ft_print_ptr.c ft_print_per.c \
				ft_print_nbr.c ft_print_usg.c ft_print_hex.c

GNL			=	get_next_line.c get_next_line_utils.c ft_gnl_trim.c

SRCS		=	$(addprefix $(SRC_DIR)/ctype/, $(CTYPE)) \
				$(addprefix $(SRC_DIR)/mem/, $(MEM)) \
				$(addprefix $(SRC_DIR)/str/, $(STR)) \
				$(addprefix $(SRC_DIR)/conv/, $(CONV)) \
				$(addprefix $(SRC_DIR)/put/, $(PUT)) \
				$(addprefix $(SRC_DIR)/lst/, $(LST)) \
				$(addprefix $(SRC_DIR)/printf/, $(PRINTF)) \
				$(addprefix $(SRC_DIR)/gnl/, $(GNL))

OBJS		=	$(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

all:		$(NAME)

$(NAME):	$(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@printf "\033[1;34mlibft: done\033[0m\n"

bonus:		all

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c include/libft.h
	@mkdir -p $(dir $@)
	@printf "\033[1;32mCompiling \033[1;34m$<\033[0m\n"
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@$(RM) $(OBJ_DIR)

fclean:		clean
	@$(RM) $(NAME)

re:			fclean all

.PHONY:		all bonus clean fclean re
