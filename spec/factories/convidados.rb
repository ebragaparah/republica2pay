# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :convidado do
    sequence(:email) {|n| "email#{n}@examplo.com" }
  end
end
