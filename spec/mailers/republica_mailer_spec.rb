# encoding: utf-8
require 'spec_helper'

describe RepublicaMailer do
  describe "#enviar_convite" do
    before(:each) do
      @convidado = create :convidado
      @convite = create :convite, convidados: [@convidado]
      @user = create :user_com_republica
      @mail = RepublicaMailer.enviar_convite(@convite, @convidado, @user)
    end

    it "renderizar o cabeçalho" do
      @mail.subject.should eq("#{@user.email} te convidou para republica #{@user.republica.nome}")
      @mail.to.should eq([@convidado.email])
      @mail.from.should eq([@user.email])
    end

    it "renderizar corpo" do
      @mail.body.encoded.should match("#{@user.email} te convidou para participar da republica #{@user.republica.nome}")
      @mail.body.should have_link("Click aqui para aceitar o convite")
      @mail.body.encoded.should match(aceitar_convite_url(@convite, token: @convidado.token))
    end
  end
end