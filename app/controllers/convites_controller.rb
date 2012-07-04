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
end
