# encoding: utf-8
require 'spec_helper'

describe RepublicaMailer do
  describe "#enviar_convite" do
    let(:convidado) { create :convidado }
    let(:convite) { create :convite, convidados: [convidado] }
    let(:user) { create :user_com_republica }
    let(:mail) { RepublicaMailer.enviar_convite(convite, convidado, user) }

    it "renderizar o cabeçalho" do
      mail.subject.should eq("#{user.email} te convidou para republica #{user.republica.nome}")
      mail.to.should eq([convidado.email])
      mail.from.should eq([user.email])
    end

    it "renderizar corpo" do
      mail.body.encoded.should match("#{user.email} te convidou para participar da republica #{user.republica.nome}")
      mail.body.should have_link("Click aqui para aceitar o convite")
      mail.body.encoded.should include(aceitar_convite_url(convite, token: convidado.token))
    end
  end
end