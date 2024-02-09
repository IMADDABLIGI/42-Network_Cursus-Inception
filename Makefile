# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: idabligi <idabligi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/09 15:10:44 by idabligi          #+#    #+#              #
#    Updated: 2024/02/09 17:38:50 by idabligi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RUN = docker compose up --build

CLEAN = docker compose down --rmi all

all :
	cd srcs && $(RUN)

clean:
	cd srcs && $(CLEAN)

fclean : clean

re : clean all

.PHONY: up