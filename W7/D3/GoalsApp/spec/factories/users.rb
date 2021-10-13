# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character } # assigns user to the result of the block
    email { "Faker::Internet.email" } # different syntax, same result
    password { "password" }
    age { 20 }
  end
end
