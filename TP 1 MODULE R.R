# 1 : 
iris
class(iris)


# 2:
View(iris)

# 3 : 
nrow(iris)

# 4 :
ncol(iris)

# 5 :
colnames(iris)

# 6 :
summary(iris)

# 7 : 
iris$Sepal.Length

iris[,c("Sepal.Length","Species")]

# 8 :
iris[ c(100,103,105) , ]

# 9 : 
iris[c(50:100),]

# 10 :
mean(iris$Sepal.Length)

# 11:
median(iris$Sepal.Width)

# 12:
sd(iris$Petal.Length)

# 13:
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by =0.1))


# Ex 2

# 1:
dfAnime = read.csv("C:/Users/koure/Downloads/anime.csv", header = TRUE, dec = ".", sep = ",")
dfManga = read.csv("C:/Users/koure/Downloads/manga.csv", header = TRUE, dec = ".", sep = ",")

# 2:
View(dfAnime)
View(dfManga)

# 3 :
dim(dfAnime)
dim(dfManga)

# 4:
mean(dfAnime$Score)

mean(dfManga$Score)

 # la moyenne la plus élévée est dans Anime

# 5 : 
sum(dfAnime$Vote)

sum(dfManga$Vote)

# y a plus de vote chez Anime

# 6:
sd(dfAnime$Score)
sd(dfManga$Score)

#  ecart type plus petit chez manga , cest donc plus homogene

# 7 : 
quantile(dfAnime$Score, probs = seq(from=0.1, to=0.9, by=0.1))
quantile(dfManga$Score, probs = seq(from=0.1, to=0.9, by=0.1))

# le décile le plus petit est dans la dataframe anime

# Les fonctions subset(), table() et prop.table()

# 1:
extraction = subset(dfManga, Score > 9/10)
nrow(extraction)

# 2:
extraction1 = subset(dfManga, Vote >= 200000)
nrow(extraction1)

# 3:
extraction2 = subset(dfManga, Vote >= 200000, Score > 8/10)
nrow(extraction2)

# 4:
extraction3 = subset(dfManga, Score >=7 & Score <=8 )
nrow(extraction3)

# Filtre sur les Animes

# 1
effectifRating=table(dfAnime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating)

# 2
extraction2 <- subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(extraction2)

# 3
extraction3 <- subset(dfAnime, Rating == "R - 17+ (violence & profanity)" &
                        Score >= 8)
nrow(extraction3)

# 4
extraction4 <- subset(dfAnime, Rating != "R - 17+ (violence & profanity)")
nrow(extraction4)

# 5
extraction5 <- subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(extraction5)

# 6
extraction6 <- subset(dfAnime, !Rating %in% c("PG - Children","G - All Ages"))
nrow(extraction6)

# 7
extraction7 <- subset(dfAnime, Score >= 9 | Vote > 400000)
nrow(extraction7)

# Les fonctions rbind() et write.table()

# 1
dfAnime <- dfAnime[ , c("Title","Score","Vote","Ranked")]
dfManga <- dfManga[ , c("Title","Score","Vote","Ranked")]

# 2
dfAnime$Type <- "Anime"
dfManga$Type <- "Manga

# 3

dfConcat <- rbind(dfManga,dfAnime)
View(dfConcat)

dfConcat <- rbind(dfManga,dfAnime)
View(dfConcat) 


# 4



