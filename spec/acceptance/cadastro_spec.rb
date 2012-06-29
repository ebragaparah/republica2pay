# encoding: utf-8
require 'spec_helper'

feature "cadastro" do
  scenario 'só deve ser aceito mediante a confirmação' do
    zerar_email
    user = User.new email: 'email@foo.com', password: '123456'

    visit new_user_registration_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
    page.should have_content 'Uma mensagem com um link de confirmação foi enviado para seu endereço de e-mail. Por favor, abra o link para ativar sua conta.'

    logar(user)
    page.should have_content 'Você deve confirmar a sua conta antes de continuar.'
    
    ultimo_email.should_not be_nil
    ultimo_email.body.should have_link('Confirm')
  end
end