# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pbondoer <pbondoer@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/12/01 21:02:30 by pbondoer          #+#    #+#              #
#    Updated: 2018/11/12 20:59:50 by pbondoer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	:= lem-in

# directories
SRC_DIR	:= ./src
LIB_DIR	:= ./lib
INC_DIR	:= ./includes
OBJ_DIR	:= ./obj

# src / obj files
SRC		:=	main.c

OBJ		:= $(addprefix $(OBJ_DIR)/,$(SRC:.c=.o))

# compiler
CC		:= gcc
CFLAGS	:= -Wall -Wextra -Werror -Weverything -pedantic
CFLAGS	+= -O3 -march=native -pipe -flto -fwhole-program

# libraries
L_FT	:= $(LIB_DIR)/libft
include $(L_FT)/libft.mk

# rules
all:
	@$(MAKE) -C $(L_FT) all
	@$(MAKE) $(NAME)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I $(INC_DIR) $(LIB_INC) -o $@ -c $<

$(NAME): $(OBJ_DIR) $(OBJ)
	$(CC) $(OBJ) $(LIB_LNK) -o $(NAME)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re:
	@$(MAKE) fclean --no-print-directory
	@$(MAKE) all --no-print-directory

relibs:
	@$(MAKE) -C $(L_FT) re
	@$(MAKE) fclean --no-print-directory
	@$(MAKE) all --no-print-directory

# special rules
.PHONY: all clean fclean re relibs
.PRECIOUS: auteur
