NAME	=	libft.a
CC		=	cc
CFLAGS	= 	-Wall -Wextra -Werror
RM		= 	rm -rf
OBJDIR	=	obj
INCLUDES=	./

SRCS	=	ft_atoi.c				\
			ft_bzero.c				\
			ft_calloc.c				\
			ft_isalnum.c			\
			

SRCS_B	= 	ft_lstadd_back_bonus.c	\
			ft_lstadd_front_bonus.c	\
			ft_lstclear_bonus.c		\
			ft_lstdelone_bonus.c	\
			ft_lstiter_bonus.c		\
			ft_lstlast_bonus.c		\
			ft_lstmap_bonus.c		\
			ft_lstnew_bonus.c		\
			ft_lstsize_bonus.c

OBJS    =	$(SRCS:%.c=$(OBJDIR)/%.o)
OBJS_B  =	$(SRCS_B:%.c=$(OBJDIR)/%.o)

all:		${NAME}

${NAME}: ${OBJS}
	@ar rc ${NAME} ${OBJS}
	@printf "\033[1;34mlibft: done\033[0m\n"

bonus: $(OBJS) $(OBJS_B)
	@ar rcs $(NAME) $(OBJS) $(OBJS_B)
	@printf "\033[1;35mlibft bonus: done\033[0m\n"

$(OBJDIR)/%.o: %.c
	@mkdir -p $(OBJDIR)
	@printf "\033[1;32mCompiling \033[1;34m$<\033[0m\n"
	@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

clean:
	@${RM} $(OBJDIR)

fclean: clean
	@${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re bonus
