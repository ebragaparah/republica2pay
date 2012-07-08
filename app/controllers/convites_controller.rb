# encoding: utf-8
class ConvitesController < InheritedResources::Base
  actions :new, :create
  load_and_authorize_resource

  def new
    @convite = Convite.new
    @convite.convidados.build 
  end
  
  def create
    create!(notice: 'Convites enviados com sucesso'){republica_path(current_user.republica)}
    current_user.enviar_convite(@convite)
  end

  def aceitar
    convidado = Convidado.find_by_token(params[:token])
    convite = Convite.find(params[:id])
    convidado.aceitar_convite(convite)
    redirect_to new_user_session_path, notice: 'Convite foi aceito, agora você esta participando da republica.',
                                       alert: "Sua senha de acesso por padrão é seu email, se quiser clique em 'Forgot your password?' ou faça 'Sign-in' para te acesso a sua republica."
  end
end
