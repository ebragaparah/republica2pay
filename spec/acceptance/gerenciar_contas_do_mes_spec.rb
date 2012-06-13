# encoding: utf-8
require 'spec_helper'

feature "gerenciar contas do mes" do
  scenario 'fechar a fatura do mes', javascript: true do
    visit new_fatura_path
    select '1', :from => 'Dia'
    select 'Abril', :from => 'Mês'
    select '2013', :from => 'Ano'
    
    click_link "Nova conta"
    fill_in 'Nome', with: 'Agua'
    fill_in 'Valor', with: '110.45'

    click_link "Nova conta"
    within '#contas .nested-fields:nth-child(2)' do
      fill_in 'Nome', with: 'luz'
      fill_in 'Valor', with: '210'
    end

    click_button 'Criar Fatura'

    page.should have_content 'Fatura Criada com sucesso.'
    page.should have_content 'Agua'
    page.should have_content 'Valor: 110.45'
    page.should have_content 'luz'
    page.should have_content 'Valor: 210'

  end
end