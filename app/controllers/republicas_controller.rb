# encoding: utf-8
class RepublicasController < InheritedResources::Base
  load_and_authorize_resource


  def create
    @republica = current_user.criar_republica(params[:republica])
    if not @republica.nil?
      redirect_to republica_path(@republica), notice: 'Republica criada com sucesso.'
    else
      redirect_to new_republica_path, alert: 'Você só pode estar associado a uma Republica!'
    end
  end
end
