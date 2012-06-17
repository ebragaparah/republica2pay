class GruposController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @grupos = current_user.republica.grupos
  end

  def new
    @grupo = Grupo.new
    @moradores = current_user.republica.moradores
  end

  def create
    @grupo = Grupo.new(params[:grupo])
    @grupo.republica = current_user.republica

    if @grupo.save
      redirect_to grupo_path(@grupo), notice: 'Grupo criado com sucesso.'
    else
      render 'new'
    end
  end
end
