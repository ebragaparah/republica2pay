# encoding: utf-8
require 'spec_helper'

describe RepublicaMailer do
  describe "enviar convite" do
    before(:each) do
      convite = create :convite
      @user = create :user_com_republica
      @mail = RepublicaMailer.enviar_convite_de(convite, @user)
    end

    it "renderizar o cabeçalho" do
      @mail.subject.should eq("#{@user.email} te convidou para republica #{@user.republica.nome}")
      @mail.to.should eq(Convidado.all.map { |e| e.email })
      @mail.from.should eq([@user.email])
    end

  end
end