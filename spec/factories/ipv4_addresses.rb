require 'faker'
FactoryGirl.define do
  factory :ipv4_address do
    ipv4_address { Faker::Internet.ip_v4_address }
    mac_address { Faker::Internet.mac_address }
    ptr_record 'a.ptr.record.'
  end

end
