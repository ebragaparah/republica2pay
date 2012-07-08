# encoding: utf-8
require 'spec_helper'
feature 'aceitar convite' do
  scenario 'usuario não cadastrado' do
    convidado = create :convidado
    zerar_email
    convite = enviar_convite_para(convidado)
    ultimo_email.body.encoded.should include(aceitar_convite_url(convite, token: convidado.token))

    visit aceitar_convite_url(convite, token: convidado.token)

    page.should have_content 'Convite foi aceito, agora você esta participando da republica.'
    page.should have_content "Sua senha de acesso por padrão é seu email, se quiser clique em 'Forgot your password?' ou faça 'Sign-in' para te acesso a sua republica."
  end
end