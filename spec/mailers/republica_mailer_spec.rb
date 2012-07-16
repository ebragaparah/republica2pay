# encoding: utf-8
require 'spec_helper'

describe RepublicaMailer do
  let(:republica){create :republica}
  let(:user) { create :user_confirmado, republica: republica }
  let(:user2) { create :user_confirmado, republica: republica }
  
  describe "#enviar_convite" do
    let(:convidado) { create :convidado }
    let(:convite) { create :convite, convidados: [convidado] }
    let(:mail) { RepublicaMailer.enviar_convite(convite, convidado, user) }

    it "renderizar o cabeçalho" do
      mail.subject.should eq("#{user.email} te convidou para republica #{user.republica.nome}")
      mail.to.should eq([convidado.email])
      mail.from.should eq([user.email])
    end

    it "renderizar corpo" do
      mail.body.encoded.should match("#{user.email} te convidou para participar da republica #{user.republica.nome}")
      mail.body.encoded.should have_link("Click aqui para aceitar o convite")
      mail.body.encoded.should include(aceitar_convite_url(convite, token: convidado.token))
    end
  end

  describe "#enviar_debito_grupo" do
    before(:each) do
      @grupo = create :grupo, republica: republica
      @grupo.moradores = [user, user2]
      user.contas << create(:conta, grupo: @grupo)
      @mail = RepublicaMailer.enviar_debito_grupo(@grupo, user.contas.first, user)
    end

    it "renderizar o cabeçalho" do
      @mail.subject.should eq("#{user.email} fez uma compra")
      @mail.to.should eq(@grupo.moradores.map { |e| e.email })
      @mail.from.should eq([user.email])
    end

    it "renderizar corpo" do
      @mail.body.encoded.should include("#{user.email} fez uma compra de R$ #{user.contas.first.valor} no grupo #{user.grupos.first.nome} da republica #{user.republica.nome}")
      @mail.body.encoded.should have_link("Click aqui para mais informações")
      @mail.body.encoded.should include grupo_conta_url(@grupo, user.contas.first)
    end
  end
end