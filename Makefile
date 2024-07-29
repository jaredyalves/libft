NAME			:=	libft.a
NAME_BONUS		:=	$(patsubst %.a,%_bonus.a,$(NAME))

SRCDIR			:=	src
OBJDIR			:=	obj
LIBDIR			:=
INCDIR			:=	include

SRCS			:=
SRCS			+=	$(SRCDIR)/ft_atoi.c
SRCS			+=	$(SRCDIR)/ft_bzero.c
SRCS			+=	$(SRCDIR)/ft_calloc.c
SRCS			+=	$(SRCDIR)/ft_isalnum.c
SRCS			+=	$(SRCDIR)/ft_isalpha.c
SRCS			+=	$(SRCDIR)/ft_isascii.c
SRCS			+=	$(SRCDIR)/ft_isdigit.c
SRCS			+=	$(SRCDIR)/ft_isprint.c
SRCS			+=	$(SRCDIR)/ft_itoa.c
SRCS			+=	$(SRCDIR)/ft_memchr.c
SRCS			+=	$(SRCDIR)/ft_memcmp.c
SRCS			+=	$(SRCDIR)/ft_memcpy.c
SRCS			+=	$(SRCDIR)/ft_memmove.c
SRCS			+=	$(SRCDIR)/ft_memset.c
SRCS			+=	$(SRCDIR)/ft_putchar_fd.c
SRCS			+=	$(SRCDIR)/ft_putendl_fd.c
SRCS			+=	$(SRCDIR)/ft_putnbr_fd.c
SRCS			+=	$(SRCDIR)/ft_putstr_fd.c
SRCS			+=	$(SRCDIR)/ft_split.c
SRCS			+=	$(SRCDIR)/ft_strchr.c
SRCS			+=	$(SRCDIR)/ft_strdup.c
SRCS			+=	$(SRCDIR)/ft_striteri.c
SRCS			+=	$(SRCDIR)/ft_strjoin.c
SRCS			+=	$(SRCDIR)/ft_strlcat.c
SRCS			+=	$(SRCDIR)/ft_strlcpy.c
SRCS			+=	$(SRCDIR)/ft_strlen.c
SRCS			+=	$(SRCDIR)/ft_strmapi.c
SRCS			+=	$(SRCDIR)/ft_strncmp.c
SRCS			+=	$(SRCDIR)/ft_strnstr.c
SRCS			+=	$(SRCDIR)/ft_strrchr.c
SRCS			+=	$(SRCDIR)/ft_strtrim.c
SRCS			+=	$(SRCDIR)/ft_substr.c
SRCS			+=	$(SRCDIR)/ft_tolower.c
SRCS			+=	$(SRCDIR)/ft_toupper.c
SRCS_BONUS		:=
SRCS_BONUS		+=	$(SRCDIR)/ft_lstadd_back.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstadd_front.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstclear.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstdelone.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstiter.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstlast.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstmap.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstnew.c
SRCS_BONUS		+=	$(SRCDIR)/ft_lstsize.c
OBJS			:=	$(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS))
OBJS_BONUS		:=	$(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCS_BONUS))
INCS			:=	$(INCDIR)/libft.h
INCS_BONUS		:=	$(INCDIR)/libft.h

CC				:=	/bin/cc
INCLUDES		:=	-I$(INCDIR)
CFLAGS			:=	-O3 -Wall -Werror -Wextra $(INCLUDES)
LDFLAGS			:=

AR				:=	/bin/ar
ARFLAGS			:=	-rcs

RM				:=	/bin/rm
RMFLAGS			:=	-rf

COLOR_RESET		:=	\033[0m
COLOR_CLEAN		:=	\033[0;33m
COLOR_COMPILE	:=	\033[0;32m
COLOR_LINK		:=	\033[0;34m

.PHONY: all bonus clean fclean re

all: $(NAME)

bonus: $(NAME_BONUS)

$(NAME): $(OBJS)
	@printf "$(COLOR_LINK)Creating archive $@...$(COLOR_RESET)\n"
	@$(AR) $(ARFLAGS) $@ $(OBJS)

$(NAME_BONUS): $(OBJS_BONUS)
	@printf "$(COLOR_LINK)Creating bonus archive $@...$(COLOR_RESET)\n"
	@$(AR) $(ARFLAGS) $(NAME_BONUS) $(OBJS_BONUS)
	@printf "$(COLOR_LINK)Adding to $(NAME)...$(COLOR_RESET)\n"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJS_BONUS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(INCS) $(INCS_BONUS)
	@mkdir -p $(dir $@)
	@printf "$(COLOR_COMPILE)Compiling $<...$(COLOR_RESET)\n"
	@$(CC) $(CFLAGS) -o $@ -c $<

clean:
	@printf "$(COLOR_CLEAN)Cleaning up...$(COLOR_RESET)\n"
	@$(RM) $(RMFLAGS) $(OBJDIR)

fclean: clean
	@printf "$(COLOR_CLEAN)Removing $(NAME) and $(NAME_BONUS)...$(COLOR_RESET)\n"
	@$(RM) $(RMFLAGS) $(NAME) $(NAME_BONUS)

re: fclean all
