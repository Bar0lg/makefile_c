# makefile_c
Ceci est un Makefile utilisée pour des petit programmes en C.

## Configuration et Initialisation

### Configuration

Pour configurer le Makefile il suffit d'ajouter le nom de votre projet a la place de TBA dans **la 4eme ligne du Makefile**.

Si votre programme a besoin d'option de compilation spéciales (par exemple si vous utiliser la biblioteque 'ncurses' ou 'math')vous pouvez les ajouter au options de bases dans la 5eme ligne du Makefile.

Les Options de bases sont '-Wall -Wextra -fsanitize=address'.

### Initailisation

Une fois le nom configuré utiliser la commande 'make setup' pour installer l'arboressance de fichiers.

## Utilisation des dossires

### 'src/'

Tous les fichiers dans ce dossier seront compilé en fichiers objet puis en executable.
Ce dossier doit donc contenir tous les '.c'.

### 'include/'

Dans ce dossiers doivent etre placé tous les headers ('.h') du programme.

### 'dat/'

Ce dossier est pour les fichiers utilisés par le programme qui ne sont pas des fichiers code.
Lors de la compilation ses fichiers serons placés dans 'build/data'.

### 'scripts/'

Ce dossier sert a stocker des scripts qui ne font pas partit du programme (comme un fichier python ou bash).

Ce dossier n'est pas utilisé lors de la compilation.

### 'spe/'

Ici sont stockés les fichiers speciaux comme un script d'execution du programme ou un README ou une license.

Tous les fichiers présents serons placés a la base du dossier 'build/'

A l'initialisation un fichier special est deja present : Le runner

Ce fichier sert a changer le repertoire courent en celuit du fichier d'execution avant de l'executer, ceci est utile pour utiliser les chemins relatifs de maniere fiable en C lors d'interaction avec des fichiers exterieurs.

Ce fichier peut etre librement modifé.

### 'build/'

Lors de la compilation le dossiers build/ est crée et est remplis par le compilateur.

**__ATTENTION:Tous les fichers dans ce dossiers serons effacés avec la commande 'make clean' ne pas placer de ficherss que vous n'avez pas sauvegardés autre part!!!__**

    -'build/bin'
    Contient l'executable.

    -'build/data'
    Contient tous les fichiers de 'dat/'.

    -'build/obj'
    Contient tous les fichires objets '.o' de l'excutable.

Les fichier speciaux est placé a la base du dossier.

## Commandes

### make setup

Initialise l'arboressance et crée le fichier runner s'il n'existe pas.

### make install

-Créee le dossier 'build' si non-existant.

-Compile tous les fichiers C en fichiers objet et les place dans 'build/obj'.

-Crée l'executable a partir des fichiers objets.

-Copie tous les fichiers dans 'dat/' dans 'build/data'.

-Copie tous les fichiers speciaux a la base du dossier 'build'.

### make clean

Suprimme le dossier 'build'.

**__Attention a ne pas avoir mis de fichiers non sauveguardés autre part dans le dossier build avant de lacer cette commande!__**

### make create_runner

Crée le fichier runner et le place dans 'spe/'.
Si le fichier existe deja alors ne fait rien.

### make create_sandbox

Crée un dossier 'SANDBOX/' qui est une copie de tous les dossiers et fichiers presents.

Cela vous permet de tester ou debugger votre programme sur une copie provisoire de votre programme.

### make clean_sandbox

Supprimme le dossier 'SANADBOX/'.


## Conclusion

C'est un programme que je met en Open-source, vous pouver l'utiliser et le modifier a votre guise mais merci de laisser le credit a la premiere ligne du fichier.

DISCLAMER:Je decline toute responsabilité en cas de perte de données liée a ce programme.