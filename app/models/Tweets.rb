class Tweets < ActiveRecord::Base
  # Remember to create a migration! 

  def self.check_tweets(username)
    same = false
    user = TwitterUser.find_by(handle: username)
    p user;
    @tweet = $client.user_timeline(user.handle, {count: 1})
    @tweet_bd = Tweets.find_by(twitter_user_id: user.id)
    # @tweets_bd = Tweets.all.select{ |t|
    #   t.twitter_user_id == user.id
    # }
    @tweet[0].created_at == @tweet_bd.twitter_created_date ? same = true : same = false
    p "objeto tweet: "
    p @tweet[0].created_at
    p "guardado tweet: "
    p @tweet_bd.twitter_created_date
    p "SAME"
    p same
  end
  
end
