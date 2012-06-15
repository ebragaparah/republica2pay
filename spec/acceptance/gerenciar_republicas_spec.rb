# encoding: utf-8
require 'spec_helper'

feature "gerenciar republica" do
  scenario 'usuario só pode criar uma republica, o mesmo já é relacionado com a republica' do
    visit new_republica_path
    page.should have_content 'Você não tem permissão.'
    logar(create :user, email: 'usuario@email.com')

    visit new_republica_path
    fill_in 'Nome', with: 'republica 1'
    click_button 'Criar Republica'

    page.should have_content 'republica 1'
    page.should have_content 'Republica criada com sucesso.'
    within_fieldset 'Moradores' do
      page.should have_content 'usuario@email.com'
    end
  end
end