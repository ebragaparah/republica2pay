class GruposController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @grupos = current_user.republica.grupos
  end

  def new
    @grupo = Grupo.new
    @moradores = current_user.republica.moradores
  end
end
