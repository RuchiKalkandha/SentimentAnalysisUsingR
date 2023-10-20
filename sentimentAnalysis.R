library(tidyverse)
library(tidytext)
library(syuzhet)
lines = readLines("Areview.csv")

lines

hamlet = tibble(line=1:length(lines), text=lines)
hamlet

hamlet_tokens <- hamlet %>% unnest_tokens(word,text)
hamlet_tokens
hamlet_tokens %>% count(word , sort=TRUE)

data("stop_words")
stop_words

important_hamlet_tokens <- hamlet_tokens %>% anti_join(stop_words)
important_hamlet_tokens
important_hamlet_tokens %>% count(word,sort=TRUE)

review1 = as.character(lines)


review1 = iconv(review1, "latin1", "UTF-8")

get_nrc_sentiment('happy')
get_nrc_sentiment('abuse')

s1 = get_nrc_sentiment(review1)
s1

barplot(colSums(s1), col = rainbow(10),ylab='Count',main= 'Feedback Plot of Product')

