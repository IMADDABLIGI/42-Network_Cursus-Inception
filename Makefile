# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: idabligi <idabligi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/09 15:10:44 by idabligi          #+#    #+#              #
#    Updated: 2024/02/10 10:18:00 by idabligi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RUN = docker compose up --build

CLEAN = docker compose down --rmi all

all :
	cd srcs && $(RUN)

down:
	cd srcs && $(CLEAN)

re : down all
