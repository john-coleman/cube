FactoryGirl.define do
  factory :user, aliases: [:creator, :owner] do
    sequence(:username) { |n| "username#{n}" }
    name { 'Factory Girl' }
    email { "#{username}@factory.girl".downcase }
  end
end
