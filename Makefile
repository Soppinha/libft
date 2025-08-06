NAME	=	libft.a

SRCS	=	ft_isalpha.c		\
			ft_isdigit.c		\
			ft_isalnum.c		\
			ft_isascii.c		\
			ft_isprint.c		\
			ft_strlen.c			\
			ft_memset.c			\
			ft_bzero.c			\
			ft_memcpy.c			\
			ft_memmove.c		\
			ft_toupper.c		\
			ft_tolower.c		\
			ft_strchr.c			\
			ft_strrchr.c		\
			ft_memchr.c			\
			ft_memcmp.c			\
			ft_strchr.c			\
			ft_strrchr.c		\
			ft_strlcpy.c		\
			ft_strlcat.c		\
			ft_strncmp.c		\
			ft_strnstr.c		\
			ft_atoi.c			\
			ft_calloc.c			\
			ft_strdup.c			\
			ft_substr.c			\
			ft_strjoin.c		\
			ft_itoa.c			\
			ft_split.c			\
			ft_strmapi.c		\
			ft_strtrim.c		\
			ft_striteri.c		\
			ft_putchar_fd.c		\
			ft_putstr_fd.c		\
			ft_putendl_fd.c		\
			ft_putnbr_fd.c		

SRCS_B	= 	ft_lstadd_back_bonus.c	\
			ft_lstadd_front_bonus.c	\
			ft_lstclear_bonus.c		\
			ft_lstdelone_bonus.c	\
			ft_lstiter_bonus.c		\
			ft_lstlast_bonus.c		\
			ft_lstmap_bonus.c		\
			ft_lstnew_bonus.c		

INCLUDES=	./

OBJS	=	${SRCS:%.c=obj/%.o}
OBJS_B	=	${SRCS_B:%.c=obj/%.o}

CFLAGS	= -Wall -Wextra -Werror
RM		= rm -rf

all: ${OBJS} ${NAME}
bonus: ${OBJS} ${OBJS_B} ${NAME}
	@ar rc ${NAME} ${OBJS_B}

obj/%.o: %.c
	@mkdir -p obj
	@printf "\033[1;32mCompiling \033[1;34m$<\033[0m\n"
	@${CC} ${CFLAGS} -I${INCLUDES} -c $< -o $@
	@sleep 0.1

${NAME}:
	@ar rc ${NAME} ${OBJS}
	@printf "\033[1;34mlibft: done\033[0m\n"

clean:
	@${RM} obj

fclean: clean
	@${RM} ${NAME} ${NAME_B}

re: fclean all

.PHONY: all clean fclean re bonus
