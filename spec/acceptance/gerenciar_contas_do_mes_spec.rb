# encoding: utf-8
require 'spec_helper'

feature "gerenciar contas do mes" do
  
  scenario 'autorização' do
    create :user, email: 'user@email.com', password: '123456'
    visit new_fatura_path
    page.should have_content 'Você não tem permissão.'
    page.should have_content 'Sign in'

    visit new_user_session_path
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: '123456'
    click_button 'Sign in'
    page.should have_content 'Você entrou com sucesso.'
    visit new_fatura_path 
    page.should have_content 'Nova fatura'

  end
  
  scenario 'fechar a fatura do mes', javascript: true do
    republica = create :republica, nome: 'Republica Foo'
    3.times {create :user, republica: republica}
    logar (create :user, republica: republica)

    visit new_fatura_path
    select '1', :from => 'Dia'
    select 'Abril', :from => 'Mês'
    select '2013', :from => 'Ano'
    
    click_link "Nova conta"
    fill_in 'Nome', with: 'Agua'
    fill_in 'Valor', with: '100.44'

    click_link "Nova conta"
    within '#contas .nested-fields:nth-child(2)' do
      fill_in 'Nome', with: 'luz'
      fill_in 'Valor', with: '300'
    end

    click_button 'Criar Fatura'

    page.should have_content 'Fatura Criada com sucesso.'
    page.should have_content 'Agua'
    page.should have_content 'Valor: 100.44'
    page.should have_content 'luz'
    page.should have_content 'Valor: 300'

    page.should have_content 'Total: 400.44'
    page.should have_content 'Por pessoa: 100.11'

  end
end