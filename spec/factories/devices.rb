FactoryGirl.define do
  factory :device do

    sequence(:hostname) { |n| "host#{n}" }
    creator
    owner
    # ad_computer_account
    # ipv4_address
    os 'cisco'
    pci_scope false

    trait :centos do
      os 'centos'
    end

    trait :ubuntu do
      os 'ubuntu'
    end

    trait :windows do
      os 'windows'
    end
  end

end
