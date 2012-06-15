require 'spec_helper'

describe User do
  it "deveria criar apenas uma republica" do
    user = create :user

    republica = user.criar_republica(nome: 'republica1')
    User.first.republica.should == republica
    user.criar_republica(nome: 'republica2').should be_nil
  end
end
