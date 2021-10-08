# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
Comment.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

users = User.create([{username: "matt"}, {username: "david"}, {username: "artist3"}])
artworks = Artwork.create([{title: "matt_test1", image_url: "matt_url1", artist_id: 1}, {title: "matt_test2", image_url: "matt_url2", artist_id: 1}, {title: "david_test1", image_url: "david_url1", artist_id: 2}, {title: "david_test2", image_url: "david_url2", artist_id: 2}, {title: "test3", image_url: "test1", artist_id: 3}])
shares = ArtworkShare.create([{artwork_id:1,viewer_id:2}, {artwork_id:2,viewer_id:1}, {artwork_id:3,viewer_id:1}, {artwork_id:3,viewer_id:2}, {artwork_id:5,viewer_id:2}, {artwork_id:6,viewer_id:1}])
comments = Comment.create([{body: 'Testing body', user_id: 1, artwork_id: 1}, {body: 'Test body 2', user_id: 2, artwork_id: 2}])