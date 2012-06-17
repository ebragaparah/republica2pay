class GruposController < InheritedResources::Base
  load_and_authorize_resource

  def index
    @grupos = current_user.republica.grupos
  end
end
