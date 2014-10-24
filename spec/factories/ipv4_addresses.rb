require 'faker'
FactoryGirl.define do
  factory :ipv4_address do
    #sequence(:ipv4_address) { |n| IPAddr.new(n, Socket::AF_INET).to_s }
    ipv4_address { Faker::Internet.ip_v4_address }
    mac_address { Faker::Internet.mac_address }
    ptr_record 'a.ptr.record.'
  end

end
