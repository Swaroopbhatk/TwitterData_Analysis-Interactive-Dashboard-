library(twitteR)
#install.packages("base64enc")
library(base64enc)

# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "0Vfu5oSPVU0TdWZPvQYqMbmLN"
consumer_secret <- "jTW4evnQb2FDr0nL65saiPFbos5j2y41ZY8SdMraVJONjF85yb"
access_token <- "973186672409108480-HjveME25yvLyWSi8iCykN9XJ78ERC39"
access_secret <- "eikbWqXsQzupbPyJLZoxidO3EFnRkWzjUNtDnH9xmw1s8"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('#IrishWater', n = 700, since = '2017-01-01', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)


#is.na(d$longitude)


#Subs1<-subset(d, (!is.na(d$latitude)))

users <- lookupUsers(d$screenName)
users_df <- twListToDF(users)
rownames(users_df) <- c()

write.csv(d, file = "TwitterData.csv")
write.csv(users_df, file = "UserInfo.csv")