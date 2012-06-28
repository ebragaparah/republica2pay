# encoding: utf-8
require 'spec_helper'

feature "cadastro" do
  scenario 'só deve ser aceito mediante a confirmação' do
    zerar_email
    user = User.create! email: 'user@email.com', password: '123456'

    logar(user)
    page.should have_content 'Você deve confirmar a sua conta antes de continuar.'
    
    ultimo_email.should_not be_nil
    ultimo_email.body.should have_link('Confirm')
  end
end