# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conta do
    sequence(:nome) {|n| "conta#{n}" }
    valor 100
  end
end
