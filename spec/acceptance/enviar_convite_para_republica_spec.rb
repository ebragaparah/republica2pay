# encoding: utf-8
require 'spec_helper'
feature 'enviar convites' do
  scenario 'para usuarios não cadastrados', javascript: true do
    visit(new_convite_path)
    
    current_path.should_not eql(new_convite_path)
    page.should have_content 'Você não tem permissão para acessar esse conteúdo.'

    logar(create :user_com_republica)
    zerar_email
    
    visit new_convite_path

    fill_in 'Email', with: 'vader@email.com'

    click_link 'Novo convidado'
    within '#convidados .nested-fields:nth-child(2)' do
      fill_in 'Email', with: 'yoda@email.com'
    end
    
    fill_in 'Mensagem', with: 'Chega mais!'

    click_button 'Enviar convites'
    page.should have_content 'Convites enviados com sucesso'
    ultimo_email.should_not be_nil
  end
end