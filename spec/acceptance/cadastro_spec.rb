# encoding: utf-8
require 'spec_helper'

feature "cadastro" do
  scenario 'só deve ser aceito mediante a confirmação' do
    ActionMailer::Base.deliveries = []
    user = create :user

    logar(user)
    page.should have_content 'Você deve confirmar a sua conta antes de continuar.'

    
  end
end