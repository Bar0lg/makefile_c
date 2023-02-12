#Script fait par Tristan L

#Configuration
NAME = TBD
CFLAGS = -Wall -Wextra -fsanitize=address
NOM_RUNNER = runner.sh

#Variables
CC = gcc
#Chemins
VPATH = src:build:src/obj:build/bin:dat:build/data:spe:dat
#Emplacments des differents dossiers
BINDIR = build/bin/
OBJDIR = build/obj/
IDIR = include/
SRCDIR= src/
DATDIR=dat/
DATDIREND = build/data/
SPEDIR = spe/
BUILDDIR = build/

#Tous les fichiers de src/
SRC = $(wildcard $(SRCDIR)*.c)

#Tous les fichiers de build/obj
OBJ = $(SRC:$(SRCDIR)%.c=$(OBJDIR)%.o)

.PHONY:$(BINDIR)$(NAME)
.SILENT:


#Installation du Programme
install:
	mkdir -p build/bin
	mkdir -p build/obj
	mkdir -p build/data
	make $(BINDIR)$(NAME) --no-print-directory
	make copy_spe --no-print-directory
	chmod +x $(BUILDDIR)$(NOM_RUNNER)
	echo "Installation effectue avec Succes"


#Compilation du fichier final.
$(BINDIR)$(NAME):$(OBJ)
	$(CC) $(CFLAGS) -o $@ $^
	cp $(DATDIR)* $(DATDIREND)
	echo "$(NAME) compilé avec succes."


#Compilation de tous les fichiers intermediares
$(OBJDIR)%.o:$(SRCDIR)%.c
	$(CC) -c $(CFLAGS) -o $@ $^ -I $(IDIR)
	echo "$@ compile avec succes."

#nettoyage des fichiers intermédiares
clean:
	rm -rf build 
	echo "Nettoyage effectue."


%.o : %.c

#Initialisation du Makefile uniquement quand le nom est configure
setup:
ifneq (TBD,$(NAME))
	mkdir -p src
	mkdir -p include 
	mkdir -p scripts
	mkdir -p dat
	mkdir -p spe
	touch README.md
	make create_runner --no-print-directory
	echo -e "Initialisation terminee: \nN'oublier pas de rajouter les options de compilation dans le Makefile"
else
	echo "Veuiller configurer le nom de l'executable dans le Makefile"
endif
	

create_runner:
ifeq (,$(wildcard $(SPEDIR)$(NOM_RUNNER)))
	echo -e "#!/bin/bash\ncd \$$(dirname \$$(realpath \$$0))/bin\n./$(NAME)" > $(SPEDIR)$(NOM_RUNNER)
	echo "Fichier runner cree"
else
	echo "Fichier runner deja existant"
endif
	
#Creation de la sandbox
create_sandbox:
	mkdir -p SANDBOX
	cp -r ./* ./SANDBOX/
	echo "Sanbox cree"

#Destruction de la sandbox
clean_sandbox:
	rm -rf SANDBOX
	echo "Sandbox supprimee"

#Copie du runner
copy_spe:
	cp $(SPEDIR)* $(BUILDDIR)
	echo "Fichiers speciaux deplacés avec succes"

