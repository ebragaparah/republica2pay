# encoding: utf-8
require 'spec_helper'

feature "gerenciar grupos" do
  scenario 'criar um grupo' do
    familia = create :republica
    luke, obiwan = create(:user, republica: familia), create(:user)
    
    visit new_grupo_path
    page.should have_content 'Você não tem permissão.'
    logar(create :user, email: 'vader@email.com', republica: familia)
    visit new_grupo_path
    
    page.should have_content 'Novo grupo'
    page.should have_content luke.email
    page.should_not have_content obiwan.email

    fill_in 'Nome', with: 'Pendencia'
    check luke.email
    click_button 'Criar Grupo'

    page.should have_content 'Grupo Pendencia'
    page.should have_content luke.email
    page.should have_content 'vader@email.com'
  end

  scenario 'usuario só pode ver grupos relacionados a sua republica' do
    starwars = create :republica
    vader = create :user, republica: starwars
    
    criar_grupo(republica: starwars, nome: 'sith', user: vader)
    criar_grupo(republica: starwars, nome: 'jedi', user: vader)
    criar_grupo(republica: create(:republica), nome: 'zodiaco', user: vader)

    logar(vader)
    visit grupos_path

    page.should have_content 'sith'
    page.should have_content 'jedi'
    page.should_not have_content 'zodiaco'
  end
end