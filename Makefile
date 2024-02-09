# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: idabligi <idabligi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/09 15:10:44 by idabligi          #+#    #+#              #
#    Updated: 2024/02/09 19:20:37 by idabligi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RUN = docker compose up --build
VOLUME = docker volume create --opt type=none --opt device=/Users/idabligi/Desktop/volume --opt o=bind WordPress

CLEAN = docker compose down --rmi all

all :
	cd srcs && $(VOLUME)
	cd srcs && $(RUN)

clean:
	cd srcs && $(CLEAN)

fclean : clean

re : clean all

.PHONY: up