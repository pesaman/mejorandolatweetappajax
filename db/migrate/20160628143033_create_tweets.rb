class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :twitter_user_id
      t.datetime :twitter_created_date
      t.timestamp
    end
  end
end
  