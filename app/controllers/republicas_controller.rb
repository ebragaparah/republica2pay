# encoding: utf-8
class RepublicasController < InheritedResources::Base
  load_and_authorize_resource

  def show
    @republica = Republica.find(params[:id])
    redirect_to root_path, alert: 'Você não tem permissão para acessar esse conteúdo.' if current_user.republica != @republica
  end

  def create
    @republica = current_user.criar_republica(params[:republica])
    if not @republica.nil?
      redirect_to republica_path(@republica), notice: 'Republica criada com sucesso.'
    else
      redirect_to new_republica_path, alert: 'Você só pode estar associado a uma Republica!'
    end
  end

  def receber_morador
    @republica = Republica.find(params[:id])
    current_user.republica = @republica
    render 'show' if current_user.save
  end
end
