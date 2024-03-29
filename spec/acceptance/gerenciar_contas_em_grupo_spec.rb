# encoding: utf-8
require 'spec_helper'

feature "gerenciar contas em um grupo" do
  scenario 'criação de uma conta simples', javascript: true do
    zerar_email

    republica = create :republica
    grupo = create :grupo, republica: republica
    
    goku = create :user_confirmado, republica: republica, grupos: [grupo]
    vegeta = create :user_confirmado, republica: republica, grupos: [grupo]

    visit new_grupo_conta_path(grupo)
    page.should have_content 'Você não tem permissão para acessar esse conteúdo.'
    
    logar(goku)
    visit grupo_path(goku.grupos.first)
    click_link 'Nova conta'

    fill_in 'Nome', with: 'Agua'
    fill_in 'Valor', with: '100.44'
    fill_in 'Descrição', with: 'Descrição opcional qualquer.'
    click_button 'Criar Conta'

    page.should have_content 'Conta criada com sucesso.'

    within_fieldset goku.email do
      page.should have_content 'Debito: 0'  
    end
    
    within_fieldset vegeta.email do
      page.should have_content 'Debito: 100.44'  
    end

    click_link 'Contas'
    click_link 'clique aqui'
    page.should have_content 'Agua'
    page.should have_content '100.44'
    page.should have_content 'Descrição opcional qualquer.'

    ultimo_email.should_not be_nil
    ultimo_email.to.should == grupo.moradores.map { |e| e.email }    
    ultimo_email.body.should have_content 'Debito: 0'  
    ultimo_email.body.should have_content 'Debito: 100.44'  
  end
end