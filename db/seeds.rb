# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 

twiterre_user1 = TwitterUser.create(twitter_handles: "example1")
tweet1 = Tweet.create(twitter_user_id: twiterre_user1, tweet: "tweet1")
tweet2 = Tweet.create(twitter_user_id: twiterre_user1, tweet: "tweet2")
tweet3 = Tweet.create(twitter_user_id: twiterre_user1, tweet: "tweet3")