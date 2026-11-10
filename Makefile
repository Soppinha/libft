NAME		=	libft.a
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
INCLUDES	=	-Iinclude
RM			=	rm -rf

SRC_DIR		=	src
OBJ_DIR		=	obj

PRINTF_DIR	=	ft_printf
PRINTF_LIB	=	$(PRINTF_DIR)/libftprintf.a
PRINTF_DEPS	=	$(wildcard $(PRINTF_DIR)/src/*.c $(PRINTF_DIR)/include/*.h)

GNL_DIR		=	gnl
GNL_STAMP	=	$(GNL_DIR)/obj/get_next_line_bonus.o
GNL_DEPS	=	$(wildcard $(GNL_DIR)/src/*_bonus.c $(GNL_DIR)/include/*_bonus.h)

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

GNL			=	ft_gnl_trim.c

SRCS		=	$(addprefix $(SRC_DIR)/ctype/, $(CTYPE)) \
				$(addprefix $(SRC_DIR)/mem/, $(MEM)) \
				$(addprefix $(SRC_DIR)/str/, $(STR)) \
				$(addprefix $(SRC_DIR)/conv/, $(CONV)) \
				$(addprefix $(SRC_DIR)/put/, $(PUT)) \
				$(addprefix $(SRC_DIR)/lst/, $(LST)) \
				$(addprefix $(SRC_DIR)/gnl/, $(GNL))

OBJS		=	$(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

all:		$(NAME)

$(NAME):	$(OBJS) $(PRINTF_LIB) $(GNL_STAMP)
	@ar rcs $(NAME) $(OBJS) $(PRINTF_DIR)/obj/*.o $(GNL_DIR)/obj/*_bonus.o
	@printf "\033[1;34mlibft: done\033[0m\n"

$(PRINTF_LIB):	$(PRINTF_DEPS)
	@if [ ! -f $(PRINTF_DIR)/Makefile ]; then \
		git submodule update --init $(PRINTF_DIR); fi
	@$(MAKE) -s -C $(PRINTF_DIR)

$(GNL_STAMP):	$(GNL_DEPS)
	@if [ ! -f $(GNL_DIR)/Makefile ]; then \
		git submodule update --init $(GNL_DIR); fi
	@$(MAKE) -s -C $(GNL_DIR) bonus > /dev/null

bonus:		all

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c include/libft.h
	@mkdir -p $(dir $@)
	@printf "\033[1;32mCompiling \033[1;34m$<\033[0m\n"
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@$(RM) $(OBJ_DIR)
	@if [ -f $(PRINTF_DIR)/Makefile ]; then $(MAKE) -s -C $(PRINTF_DIR) clean; fi
	@if [ -f $(GNL_DIR)/Makefile ]; then $(MAKE) -s -C $(GNL_DIR) clean > /dev/null; fi

fclean:		clean
	@$(RM) $(NAME)
	@if [ -f $(PRINTF_DIR)/Makefile ]; then $(MAKE) -s -C $(PRINTF_DIR) fclean; fi
	@if [ -f $(GNL_DIR)/Makefile ]; then $(MAKE) -s -C $(GNL_DIR) fclean > /dev/null; fi

re:			fclean all

.PHONY:		all bonus clean fclean re
