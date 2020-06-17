User.destroy_all 
Post.destroy_all
Comment.destroy_all
Like.destroy_all
Friend.destroy_all
Reply.destroy_all

35.times do 
response = RestClient.get('https://randomuser.me/api/')
data = JSON.parse(response)
User.create(first_name: data["results"][0]["name"]["first"], last_name: data["results"][0]["name"]["last"], age: data["results"][0]["dob"]["age"], email: data["results"][0]["email"], location: data["results"][0]["location"]["city"], picture: data["results"][0]["picture"]["large"], password: data["results"][0]["login"]["password"], bio: Faker::TvShows::MichaelScott.quote, occupation: Faker::Job.title, college: Faker::University.name)
end 

155.times do 
Post.create(caption: Faker::GreekPhilosophers.quote, user_id: User.all.sample.id, date: Faker::Date.forward(days: 23) )
end 

90.times do 
Like.create(user_id: User.all.sample.id, post_id: Post.all.sample.id ) 
end 

500.times do 
Comment.create(user_id: User.all.sample.id, post_id: Post.all.sample.id, content: Faker::TvShows::GameOfThrones.quote )
end 

200.times do 
Reply.create(comment_id: Comment.all.sample.id , content: Faker::Games::WarhammerFantasy.quote, user_id: User.all.sample.id )
end 

90.times do 
Friend.create(user_id_1: User.all.sample.id, user_id_2: User.all.sample.id)
end 