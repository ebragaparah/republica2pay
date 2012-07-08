# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :convite do
    mensagem "MyText"
    convidados {[create(:convidado)]}
    republica {create :republica}
  end
end
