# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@email.com" }
    password '123456'

    factory :user_confirmado do
      after(:create) { |u| u.confirm! }

      factory :user_com_republica do
        republica {create :republica}
      end
    end
  end
end
