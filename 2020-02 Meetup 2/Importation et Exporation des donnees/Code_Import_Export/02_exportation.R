# Quelques methodes d'importation des donnees dans R #
# Par Ruth OUANGBEY et Nadejda Sero #
# Meetup 2, R-Ladies Cotonou  #
# 08/01/2020 #

# Tapez Ctrl + Shift + F10 pour redemarrer la session
# et ainsi nettoyer impeccablement l'environnement


# les bases de donnees a exporter (dans R)
data(iris)
iris
data(mtcars)

# 1. Copier-coller

# Affichez la base puis aller dans la console pour
# selectionner, copier et coller dans un fichier excel
# ou coller dans un fichier txt qui est directement utilisable.

iris

mtcars

# 2. Addin ClipR ---

# Pareil a un copier coller. Dans votre code, selectionner 
# l'objet ou l'expression qu'on veut exporte. Ensuite cliquer 
# sur Addin. Dans le groupe ClipR, choisir "Output to clipboard"
# ou "Value to clipboard". Ouvrir son fichier excel ou txt puis coller.

# d1 <- readr::read_tsv('test1.txt')
# d1



# 3. Base R ------

# exporter sous format txt ----

write.table(mtcars, file = "mtcars.txt", sep = "\t",
            row.names = TRUE, col.names = TRUE)

# exporter sous format csv ------ 
# point decimal = "." et separateur de valeurs = virgule (",")

write.csv(iris, file = "iris.csv")

# point decimal = virgule (",") et separateur de 
# valeurs = point-virgule (";") 

write.csv2(iris, file = "iris1.csv")



# 4. Readr -------

library(readr)

# exporter sous format txt -------

write_tsv(iris, path = "iris.txt")

# exporter sous format csv -------
write_csv(mtcars, path = "mtcars.csv")


# 5. writexl -------

library(writexl)

# exportation de deux bases simultanement 

a1 <- write_xlsx(list(sheet1 = iris, sheet2 = mtcars),
                 path = "iris_mtcars.xlsx")

readxl::read_xlsx(a1, sheet = 1) # to display iris data
readxl::read_xlsx(a1, sheet = 2) # to display mtcars data

# exportation d'une base 

write_xlsx(list(sheet1 = mtcars),
                 path = "cars.xlsx")


# 6. openxlsx ----

library(openxlsx)

# exportation de deux bases simultanement 

list_data <- list("flowers" = iris, "cars" = mtcars)

write.xlsx(list_data, "flower_car.xlsx")

# exportation d'une base 
write.xlsx(iris, "flowers.xlsx")


# Tapez Ctrl + Shift + F10 pour redemarrer la session
# et ainsi nettoyer impeccablement l'environnement
