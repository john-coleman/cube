FactoryGirl.define do
  factory :user, aliases: [:creator, :owner] do
    sequence(:username) { |n| "username#{n}" }
    name { username.capitalize }
    email { "#{username}@example.com".downcase }
  end
end
