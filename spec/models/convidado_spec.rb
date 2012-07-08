# encoding: utf-8
require 'spec_helper'

describe Convidado do
  it{ should_not have_valid(:email).when(nil) }
  it{ should_not have_valid(:email).when("nil") }
  it{ should have_valid(:email).when("nil@email.com") }

  describe "#gerar_token" do
    it "gera automaticamente durante a criação" do
      create(:convidado).token.should_not be_nil
    end
  end
  
  describe '#aceitar_convite' do
    context "não cadastrado" do
      before(:each) do
        @convidado = create(:convidado)
        @republica = create(:republica)
        @convidado.aceitar_convite create(:convite, convidados: [@convidado], republica: @republica)
      end

      it "se transforma em um user" do      
        User.find_by_email(@convidado.email).should_not be_nil
        Convidado.all.should_not include @convidado
      end

      it "o novo user deve estar associado a republica do convite" do
        User.find_by_email(@convidado.email).republica.should eq(@republica)
      end
    end
  end
end
