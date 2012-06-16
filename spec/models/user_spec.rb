require 'spec_helper'

describe User do
  before(:each) do
    @user = create :user
  end

  it "deveria criar apenas uma republica" do
    republica = @user.criar_republica(nome: 'republica1')
    User.first.republica.should == republica
    @user.criar_republica(nome: 'republica2').should be_nil
  end

  it "deveria ser capaz de entrar/mudar de republica" do
    republica1 = create :republica
    republica2 = create :republica

    @user.entrar_em(republica1)
    User.first.republica.should == republica1
  end
end
