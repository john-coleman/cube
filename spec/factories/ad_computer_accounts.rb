FactoryGirl.define do
  factory :ad_computer_account do
    domain 'factory.girl'
    sequence(:machine_account) { |n| "factory-girl#{n}" }
    ou 'OU=Factory Girl,DC=factory,DC=girl'
  end

end
