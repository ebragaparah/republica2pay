# encoding: utf-8
require 'spec_helper'

feature "gerenciar conta" do
  scenario 'adicionar uma nova conta' do
    visit new_conta_path
    fill_in 'Nome', with: 'Agua'
    fill_in 'Valor', with: 110.45
    click_button 'Salvar'

    page.should have_content 'Conta criada com sucesso.'
  end
end