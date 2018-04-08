FactoryBot.define do
  factory :user do
    email 'tester@testdomain.test'
    password 'p@s$word'
    confirmed_at Time.now
  end
end
