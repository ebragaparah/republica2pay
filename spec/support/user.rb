def logar(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'
end

def deslogar
  click_link 'Logout'
end

def criar_grupo(params)
  logar(params[:user])
  
  visit new_grupo_path
  
  republica_atual, params[:user].republica = params[:user].republica, params[:republica]
  params[:user].save!
  
  fill_in 'Nome', with: params[:nome]
  click_button 'Criar Grupo'

  params[:user].republica = republica_atual
  params[:user].save!
  deslogar
end

def enviar_convite_para(convidado)
  convite = create :convite, convidados: [convidado]
  create(:user_com_republica).enviar_convite(convite)
  return convite
end