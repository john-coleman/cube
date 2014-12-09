FactoryGirl.define do
  factory :device do

    sequence(:hostname) { |n| "host#{n}" }
    domain 'factory.girl'
    creator
    owner
    # TODO
    # ad_computer_account
    os 'cisco'
    pci_scope 'false'

    trait :centos do
      os 'centos'
    end

    trait :ubuntu do
      os 'ubuntu'
    end

    trait :windows do
      os 'windows'
    end

    trait :with_ipv4_address do
      ipv4_addresses { [FactoryGirl.build(:ipv4_address)] }
    end
  end

end
