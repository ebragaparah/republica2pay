# encoding: utf-8
require 'spec_helper'

feature "gerenciar contas especificas" do
  scenario 'criar um grupo com contas especificas' do
    familia = create :republica
    anakin, obiwan = create(:user, republica: familia), create(:user)
    
    visit new_grupo_path
    page.should have_content 'Você não tem permissão.'
    logar(create :user, email: 'vader@email.com', republica: familia)
    visit new_grupo_path
    
    page.should have_content 'Novo grupo'
    page.should have_content anakin.email
    page.should_not have_content obiwan.email

    fill_in 'Nome', with: 'Pendencia'
    check anakin.email
    click_button 'Criar Grupo'

    page.should have_content 'Grupo Pendencia'
    page.should have_content anakin.email
    page.should have_content 'vader@email.com'
  end
end