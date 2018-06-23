library(twitteR)
#install.packages("base64enc")
library(base64enc)

# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "YourKey"
consumer_secret <- "YourKey"
access_token <- "YourKey"
access_secret <- "YourKey"

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
