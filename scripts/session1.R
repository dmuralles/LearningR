# Learning R
# Friday, April 12, 2019

#Initialize a cats data.frame
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0,3.2), 
                   likes_string = c(1, 0, 1))
write.csv(x= cats, file="data/feline.csv")
# an intentional error
cats$weight + cats$coat

# what type of variable?
typeof(cats$weight)
# what class is cats?
class(cats)
# vectors
#logicals
my_vector <- vector(length = 3)
my_vector

#character
another_vector <- vector(mode="character", length = 3)
another_vector

#command
str(another_vector)
str(cats$coat)
str(cats$weight)
str(cats$likes_string)
cats

#make a new vector
combine_vector <- c(2,6,3)
combine_vector
typeof(combine_vector)
quiz_vector <- c(2,6,'3')
quiz_vector
typeof(quiz_vector)
coercion_vector <- c('a', TRUE)
coercion_vector
str(coercion_vector)
another_coercion_vector <- c(0, TRUE)
another_coercion_vector
character_vector_example <- c('0','2','4')
character_vector_example

character_reassigned_example <- as.numeric(character_vector_example)
character_reassigned_example

#useful coercion
cats$likes_string
typeof(cats$likes_string)
cats$likes_string <- as.logical(cats$likes_string)
cats$likes_string

#appending
ab_vector <- c('a', 'b')
combine_example <- c(ab_vector, 'SWC')
combine_example

#populate quickly with series
mySeries <- 1:10
mySeries

#data frames section
str (cats$weight)
str (cats$coat)
coats <- c('tabby', 'tortoise-shell', 'tortoise-shell', 'black', 'tabby')
str(coats)
CATegories <-factor(coats)
str(CATegories)
levels(cats$coat)
levels(cats$coat) <- c(levels(cats$coat), "tortoise-shell")
cats <- rbind(cats, list("tortoise-shell", 3.3, TRUE, 9))

#Challenge 2
df <- data.frame(id = c("a", "b", "c"),
                 x = 1:3,
                 y = c(TRUE, TRUE, FALSE),
                 stringsAsFactors = FALSE)
typeof(cats)

#age of cats
age <- c(2,3,5,NA)
age
cats
cbind(cats, age)

# lists
list_example <- list(1, "a", TRUE, 1+4i)
list_example
another_list <- list (title ="Numbers", numbers=1:10, data=TRUE)
another_list

typeof(cats)
cats$coat
levels(cats$coat)
cats

levels(cats$coat) <- c(levels(cats$coat),'pink')
cats
levels(cats$coat)
cats