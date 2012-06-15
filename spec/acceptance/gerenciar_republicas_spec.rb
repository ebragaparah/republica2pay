# encoding: utf-8
require 'spec_helper'

feature "gerenciar republica" do
  scenario 'usuario ao criar uma republica, se relaciona com ela automaticamente' do
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

  scenario 'usuario só pode criar uma republica' do
    user = create :user
    user.criar_republica nome: 'Republica 1'
    logar(user)

    visit new_republica_path
    fill_in 'Nome', with: 'Republica 2'
    click_button 'Criar Republica'

    page.should have_content 'Você só pode estar associado a uma Republica!'
    page.should have_content 'Nova republica'
  end
end