

# 1 

# 2 :

getwd()


# 3 : 
setwd("C:/Users/koure/Downloads/dataset")
getwd()

# 4 :
dfbodies_karts = read.csv("bodies_karts.csv", header = TRUE, dec = ",", sep = ";")
dftires = read.csv("tires.csv", header = TRUE, dec = ",", sep = "\t")
dfgliders = read.csv("gliders.csv", header = TRUE, dec = "." , sep = "|" )
dfdrivers = read.csv("drivers.csv", header = TRUE, dec = ",", sep = ";")

# 5 :
dim(dfbodies_karts)
dim(dftires)
dim(dfdrivers)
dim(dfgliders)

# Exercice 2 - Statistique

# 1
summary(dfbodies_karts)
summary(dftires)
summary(dfdrivers)
summary(dfgliders)

# 2
cor(x = dfdrivers$Weight, y = dfdrivers$Acceleration )
plot(dfdrivers$Weight, dfdrivers$Acceleration , xlab = "Variable X", ylab = "Variable Y", main = "Nuage de points")

#Il semble que les deux variables soient corrélées négativement
#Il y a autant de points mais ils sont superposés car certains drivers ont les mêmes statistiques

# 3
cor(x = dfdrivers$Weight, y = dfdrivers$Acceleration )

# 4

# 5 
coefCorr = cor(x = dfdrivers$Weight, y = dfdrivers$Acceleration)

coefDeter = coefCorr^2

print(coefDeter)

# Le coefficient de détermination (R²),
# c'est un chiffre entre 0 et 1 qui dit à quel point ton modèle
# explique bien tes données.

# C'est un indicateur clé pour savoir si ta régression est utile ou pas.

# La régression c'est une technique pour prédire une valeur en fonction d'autres variables.

# En gros :
# Tu cherches une relation mathématique entre des données pour faire des prévisions.

# Drivers weight vs drivers acceleration avec R² = 0,90 :
# Ça veut dire que 90% des variations d'accélération s'expliquent
# par le poids du conducteur.

# Plus le conducteur est lourd → impact direct sur l'accélération
# La relation est très forte

# 6

matriceCor = cor(dfdrivers[ , - 1]) # on exclut la première colonne car pas quantitative, on garde toutes les lignes.
matriceCor = round(matriceCor , 2) 
View(matriceCor)
#Toutes les variables semblent fortement corrélées entre elles.

# ??? pas compris comment interrêter le tableau .... 

# 7 
install.packages("corrplot") # a installé un truc

# 8
library(corrplot)  # importer corrplot comme dans python import numpy blabla

corrplot(matriceCor, method="color")
corrplot(matriceCor, method = "circle")
corrplot(matriceCor, method = "number")

# rien compris 

# 9
# a)
matriceCor1 = cor(dfbodies_karts[ , -1]) 
matriceCor1 = round(matriceCor1 , 2)
View(matriceCor1)

corrplot(matriceCor1, method="color")

# b)
matriceCor2 = cor(dfgliders[ , -1]) # tjrs pareil on enleve la premiere colonne car qualitative 
matriceCor2 = round(matriceCor2, 2)
View(matriceCor2)

corrplot(matriceCor2, method = "circle")

# j'ai des points d 'interrogations ??? pour ground handling, pas compris pourquoi 

#c)
matriceCor3 = cor(dftires[ , -1]) # y a des champs vides dans la data 
matriceCor3 = round(matriceCor3, 2)
View(matriceCor3)

corrplot(matriceCor3, method = "circle")


# correction ..... 

matriceCor = round(cor(dftires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)



matriceCor = round(cor(dfbodies_karts[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

matriceCor = round(cor(dfgliders[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

# Exercice 3 Manipulation de data frame. всё будет хорошо....

# 1 
resultat = order(dfdrivers$Driver, dfdrivers$Weight)
View(resultat)   # faux

resultat = dfdrivers[ , c("Driver" , "Weight")]
View(resultat)

# 2 
resultat1 = dfdrivers[1:10, c("Driver" , "Acceleration")]
View(resultat1)

# 3
resultat2 = dfdrivers[ , c(-5, -7, -9)]
view(resultat2)

resultat2 = dfdrivers[ , -c(5,7,9)]
View(resultat)

# 4 
resultat3 = dfdrivers[ , -c(2,3)] # le moins devant c fonctionne uniquement avc index numérique ... 
View(resultat3)

# 5
resultat4 = dfdrivers[ ,c("Driver" , "Acceleration" , "Weight")]
View(resultat4)

# Les colonnes sont dans l'ordre que j'ai mis dans le vecteur c 

# 6 
resultat5 = dfdrivers[c(3,12,32) , ] # Pourquoi je ne peux pas mettre la colonne que je veux ? Par exemple que driver ? 

View(resultat5)

# Les lignes sont dans l'ordre défini par le vecteur.

# 7 
resultats6 = dfdrivers[ c(32,3,12) , ]
View(resultats6)

# Les lignes sont dans l'ordre défini par le vecteur.

# 8 
resultat7 = dfdrivers[  , order(c("Driver","Weight"))]

View(resultat7)

# correction : 

rang = order(dfdrivers$Weight)
resultat = dfdrivers[ rang  , c("Driver", "Weight") ]
View(resultat)

# pas compris pourquoi dans ligne on a mis une colonne ? 


# 9
rang = order(dfdrivers$Acceleration, decreasing = TRUE)
resultat8 = dfdrivers [ rang, c("Driver", "Acceleration")]
View(resultat8)

# 10
rang1 = order(dfdrivers$Acceleration, decreasing = TRUE)
rang2 = order(dfdrivers$Weight)

resultat9 = dfdrivers[c(rang1,rang2), c("Driver", "Acceleration", "Weight")]

View(resultat9)

# correction : 
rang = order(drivers$Acceleration, drivers$Weight, decreasing = c(TRUE,FALSE))
resultat = drivers[ rang  , c("Driver", "Acceleration","Weight") ]
View(resultat)

# Exercice 4 - GOAT главное не сдаваться 

# 1 
# correcrtion
help(subset)
topDriver = subset(x = dfdrivers,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Driver","Acceleration"))

# 2
# correction 

topGlider = subset(x = gliders,
                   subset = Acceleration == max(Acceleration), 
                   select = c("Glider","Acceleration"))

topTires = subset(x = tires,
                  subset = Acceleration == max(Acceleration), 
                  select = c("Tire","Acceleration"))

topBody = subset(x = bodies_karts,
                 subset = Acceleration == max(Acceleration), 
                 select = c("Body","Acceleration"))