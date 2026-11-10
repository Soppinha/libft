NAME		=	libft.a
CC			=	cc
CFLAGS		=	-Wall -Wextra -Werror
INCLUDES	=	-Iinclude
RM			=	rm -rf

# ********************************* OUTPUT ********************************** #

TAG			=	libft
RESET		=	\033[0m
C_TAG		=	\033[1;34m
C_BUILD		=	\033[0;32m
C_DONE		=	\033[1;32m
C_CLEAN		=	\033[0;33m
C_RM		=	\033[0;31m
LOG			=	printf "$(C_TAG)%-12s$(RESET) %b%-10s$(RESET) %s\n" "[$(TAG)]"
SUBMAKE		=	$(MAKE) -s --no-print-directory -C

# ********************************** BUILD ********************************** #

SRC_DIR		=	src
OBJ_DIR		=	obj

PRINTF_DIR	=	$(SRC_DIR)/ft_printf
PRINTF		=	ft_printf.o ft_parse_format.o ft_parse_spec.o \
				ft_print_char.o ft_print_str.o ft_print_ptr.o \
				ft_print_per.o ft_print_nbr.o ft_print_usg.o \
				ft_print_hex.o ft_print_utils.o ft_pf_libc.o
PRINTF_OBJS	=	$(addprefix $(PRINTF_DIR)/obj/, $(PRINTF))

GNL_DIR		=	$(SRC_DIR)/gnl
GNL			=	get_next_line_bonus.o get_next_line_utils_bonus.o
GNL_OBJS	=	$(addprefix $(GNL_DIR)/obj/, $(GNL))

CTYPE		=	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c \
				ft_isprint.c ft_toupper.c ft_tolower.c

MEM			=	ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
				ft_memchr.c ft_memcmp.c ft_calloc.c

STR			=	ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c \
				ft_strrchr.c ft_strcmp.c ft_strncmp.c ft_strnstr.c \
				ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c \
				ft_split.c ft_strmapi.c ft_striteri.c \
				ft_strjoin3.c ft_free_array.c ft_gnl_trim.c

CONV		=	ft_atoi.c ft_atol.c ft_itoa.c

PUT			=	ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

LST			=	ft_lstnew_bonus.c ft_lstadd_front_bonus.c \
				ft_lstadd_back_bonus.c ft_lstsize_bonus.c \
				ft_lstlast_bonus.c ft_lstdelone_bonus.c \
				ft_lstclear_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c \
				ft_lst_to_array.c

SRCS		=	$(addprefix $(SRC_DIR)/ctype/, $(CTYPE)) \
				$(addprefix $(SRC_DIR)/mem/, $(MEM)) \
				$(addprefix $(SRC_DIR)/str/, $(STR)) \
				$(addprefix $(SRC_DIR)/conv/, $(CONV)) \
				$(addprefix $(SRC_DIR)/put/, $(PUT)) \
				$(addprefix $(SRC_DIR)/lst/, $(LST))

OBJS		=	$(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

all:		$(NAME)

$(NAME):	$(OBJS) $(PRINTF_OBJS) $(GNL_OBJS)
	@ar rcs $(NAME) $(OBJS) $(PRINTF_OBJS) $(GNL_OBJS)
	@$(LOG) "$(C_DONE)" archived "$(NAME)"

$(PRINTF_OBJS) &:	FORCE
	@if [ ! -f $(PRINTF_DIR)/Makefile ]; then \
		git submodule update --init $(PRINTF_DIR); fi
	@$(SUBMAKE) $(PRINTF_DIR)

$(GNL_OBJS) &:	FORCE
	@if [ ! -f $(GNL_DIR)/Makefile ]; then \
		git submodule update --init $(GNL_DIR); fi
	@$(SUBMAKE) $(GNL_DIR) $(addprefix obj/, $(GNL))

FORCE:

bonus:		all

$(OBJ_DIR)/%.o:	$(SRC_DIR)/%.c include/libft.h
	@mkdir -p $(dir $@)
	@$(LOG) "$(C_BUILD)" compiling "$<"
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	@$(RM) $(OBJ_DIR)
	@$(LOG) "$(C_CLEAN)" cleaned objects
	@if [ -f $(PRINTF_DIR)/Makefile ]; then $(SUBMAKE) $(PRINTF_DIR) clean; fi
	@if [ -f $(GNL_DIR)/Makefile ]; then $(SUBMAKE) $(GNL_DIR) clean; fi

fclean:		clean
	@$(RM) $(NAME)
	@$(LOG) "$(C_RM)" removed "$(NAME)"
	@if [ -f $(PRINTF_DIR)/Makefile ]; then $(SUBMAKE) $(PRINTF_DIR) fclean; fi
	@if [ -f $(GNL_DIR)/Makefile ]; then $(SUBMAKE) $(GNL_DIR) fclean; fi

re:			fclean all

.PHONY:		all bonus clean fclean re FORCE
