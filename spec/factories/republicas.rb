# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :republica do
    sequence(:nome) {|n| "republica#{n}" }
  end
end
