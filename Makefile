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
# VOLUME_WP = docker volume create --opt type=none --opt device=/Users/idabligi/Desktop/vm/WP --opt o=bind WordPress
# VOLUME_DB = docker volume create --opt type=none --opt device=/Users/idabligi/Desktop/vm/MariaDB --opt o=bind DB

CLEAN = docker compose down --rmi all

all :
	# cd srcs && $(VOLUME_WP)
	# cd srcs && $(VOLUME_DB)
	cd srcs && $(RUN)

clean:
	cd srcs && $(CLEAN)

fclean : clean

re : clean all

.PHONY: up