# encoding: utf-8
require 'spec_helper'

feature "gerenciar contas em um grupo" do
  scenario 'criação de uma conta simples' do
    zerar_email

    republica = create :republica
    grupo = create :grupo, republica: republica
    
    goku = create :user, republica: republica, grupos: [grupo]
    vegeta = create :user, republica: republica, grupos: [grupo]

    visit new_grupo_conta_path(grupo)
    page.should have_content 'Você não tem permissão para acessar esse conteúdo.'
    
    logar(goku)
    visit new_grupo_conta_path(grupo)

    fill_in 'Nome', with: 'Agua'
    fill_in 'Valor', with: '100.44'
    click_button 'Criar Conta'

    within_fieldset goku.email do
      page.should have_content 'Debito: 0'  
    end
    
    within_fieldset vegeta.email do
      page.should have_content 'Debito: 100.44'  
    end

    ultimo_email.should_not be_nil
    ultimo_email.to.should == grupo.moradores.map { |e| e.email }    
    ultimo_email.body.should have_content 'Debito: 0'  
    ultimo_email.body.should have_content 'Debito: 100.44'  
  end
end