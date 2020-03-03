# Quelques methodes d'importation des donnees dans R #
# Par Ruth OUANGBEY et Nadejda SERO #
# Meetup 2, R-Ladies Cotonou  #
# 08/01/2020 #

# Tapez Ctrl + Shift + F10 pour redemarrer la session
# et ainsi nettoyer impeccablement l'environnement

# 1. En utilisant un Addin de Rstudio ------

# Copier la selection de donnees depuis excel ou txt,
# Cliquer sur Addins dans RStudio, selectionner "paste as data.frame"
# dans le groupe Datapasta

# Cet addin utilise le package "datapasta" qui est a telecharger 

samedi <- data.frame(
  stringsAsFactors = FALSE,
                         Nom = c("A1","A2",
                                 "A3","A4","A5","A6","A7","A8","A9",
                                 "A10","A11","A12","A13","A14","A15","A16",
                                 "A17","A18","A19","A20"),
                       Genre = c("F","F",
                                 "M","M","M","M","F","F","M","F","F","M",
                                 "M","F","M","F","M","M","F","M"),
                      Ethnie = c("Fon ouidah","Goun","Peulh","Dendi djougou","Bariba",
                                 "Fon abomey","Fon savalou","Bariba","Bariba",
                                 "Bariba","Bariba","Goun","Goun","Peulh",
                                 "Peulh","Dendi parakou","Peulh",
                                 "Hausa niger","Goun","Peulh"),
                         Age = c(58L,57L,
                                 20L,25L,53L,42L,47L,55L,23L,44L,38L,42L,
                                 35L,31L,22L,48L,51L,44L,37L,25L),
                   Taille.cm = c(154L,168L,
                                 185L,150L,185L,167L,162L,178L,164L,167L,
                                 189L,191L,183L,169L,156L,177L,166L,
                                 195L,153L,175L),
                       Poids = c(91L,119L,
                                 81L,113L,105L,75L,59L,55L,72L,92L,58L,
                                 90L,70L,89L,63L,122L,83L,82L,71L,118L),
                   Height = c(155,168,
                                 185,150,185,167,162,178,164,167,189,191,
                                 183,169,156,177,166,195,153,175),
                   Taille.en = c(1.54,1.68,
                                 1.85,1.5,1.85,1.67,1.62,1.78,1.64,1.67,
                                 1.89,1.91,1.83,1.69,1.56,1.77,1.66,1.95,
                                 1.53,1.75)
          )
  
samedi 

a1 <- data.frame(
  stringsAsFactors = FALSE,
                     Nom = c("A1","A2","A3",
                             "A4","A5","A6","A7","A8","A9","A10","A11",
                             "A12","A13","A14","A15","A16","A17","A18",
                             "A19","A20"),
                   Genre = c("F","F","M","M",
                             "M","M","F","F","M","F","F","M","M","F",
                             "M","F","M","M","F","M"),
                  Ethnie = c("Fon ouidah",
                             "Goun","Peulh","Dendi djougou","Bariba","Fon abomey",
                             "Fon savalou","Bariba","Bariba","Bariba",
                             "Bariba","Goun","Goun","Peulh","Peulh",
                             "Dendi parakou","Peulh","Hausa niger","Goun","Peulh"),
                     Age = c(58L,57L,20L,25L,
                             53L,42L,47L,55L,23L,44L,38L,42L,35L,31L,
                             22L,48L,51L,44L,37L,25L),
               Taille.cm = c(154L,168L,185L,
                             150L,185L,167L,162L,178L,164L,167L,189L,191L,
                             183L,169L,156L,177L,166L,195L,153L,175L),
                   Poids = c(91L,119L,81L,
                             113L,105L,75L,59L,55L,72L,92L,58L,90L,70L,
                             89L,63L,122L,83L,82L,71L,118L),
               Taille.fr = c(154,168,185,150,
                             185,167,162,178,164,167,189,191,183,169,
                             156,177,166,195,153,175),
               Taille.en = c(1.54,1.68,1.85,
                             1.5,1.85,1.67,1.62,1.78,1.64,1.67,1.89,1.91,
                             1.83,1.69,1.56,1.77,1.66,1.95,1.53,1.75)
      )

a1


# 2. Base R --------
# 2.1. En utilisant le presse-papiers --------

# decimal = "." ----
b1 <- read.table('clipboard', header = TRUE)
b1


# decimal = "," ----
b2 <- read.table('clipboard', header = TRUE, dec = ',')
b2


# 2.2. Avec un fichier txt -----

c1 <- read.table('import_data.txt', header = TRUE, dec = ',')
c1

c11 <- read.table('import_avec_barres.txt', header = TRUE, dec = ',')
c11
str(c11)


# 2.3. Avec un lien URL -----

# d1 <- read.table('https://drive.google.com/open?id=1I44Fj5WW8EAZyy3go_pshVzHE-WCFGOq', 
#                  header = TRUE)
# d1
# str(d1)


# 3. Readr -----

library(readr)

# 3.1. Fichier txt -----

e1 <- read_tsv('import_data.txt')
e1 # mais les virgules de la taille fr ne sont plus

# ramenons les virgules --
e2 <- read_tsv('import_data.txt',
               locale = locale(decimal_mark = ","))
e2 # mais les virgules de la taille fr ne sont plus


e3 <- read_delim('import_data.txt', delim = "\t", 
                 locale = locale(decimal_mark = ","))
e3

# L'argument locale des fonctions d'importation de readr
# permet de changer des caracteristiques de son systeme comme
# le format de la date, du temps, la zone horaire, le type de 
# marque decimale utilisee ("," pour les fr et "." pour
# les anglophones)


# 4. Importer directement depuis Excel ------

# With the package readxl 

library(readxl)

f1 <- read_excel('import_data.xlsx', sheet = 'avec_barres')
f1

f2 <- read_excel('import_data.xlsx', sheet = 2)
f2



# Tapez Ctrl + Shift + F10 pour redemarrer la session
# et ainsi nettoyer impeccablement l'environnement
