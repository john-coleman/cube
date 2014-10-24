FactoryGirl.define do
  factory :device do
    trait :centos do
      os 'Centos'
    end

    trait :ubuntu do
      os 'Ubuntu'
    end

    trait :windows do
      os 'Windows'
    end

    sequence(:hostname) { |n| "host#{n}" }
    #ad_computer_account { FactoryGirl.build :ad_computer_account}
    #ipv4_address { FactoryGirl.build :ipv4_address }
    os 'Cisco'
    pci_scope false
  end

end
