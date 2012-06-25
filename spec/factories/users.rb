# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@email.com" }
    password '123456'
    after(:create) { |u| u.confirm! }
  end
end
