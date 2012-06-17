# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grupo do
    sequence(:nome) {|n| "grupo#{n}" }
    republica {create :republica}
  end
end
