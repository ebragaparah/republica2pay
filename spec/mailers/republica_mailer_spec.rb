# encoding: utf-8
require 'spec_helper'

describe RepublicaMailer do
  describe "enviar convite" do
    before(:each) do
      @convite = create :convite
      @user = create :user_com_republica
      @mail = RepublicaMailer.enviar_convite_de(@convite, @user)
    end

    it "renderizar o cabeçalho" do
      @mail.subject.should eq("#{@user.email} te convidou para republica #{@user.republica.nome}")
      @mail.to.should eq(Convidado.all.map { |e| e.email })
      @mail.from.should eq([@user.email])
    end

    it "renderizar corpo" do
      @mail.body.encoded.should match("#{@user.email} te convidou para participar da republica #{@user.republica.nome}")
      @mail.body.should have_link("Click aqui para aceitar o convite")
      @mail.body.encoded.should match(aceitar_convite_url(@convite))
    end
  end
end