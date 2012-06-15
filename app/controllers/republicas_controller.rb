class RepublicasController < InheritedResources::Base
  load_and_authorize_resource


  def create
    @republica = Republica.new(params[:republica].merge!(moradores: [current_user]
 ))
    if @republica.save
      redirect_to republica_path(@republica), notice: 'Republica criada com sucesso.'
    else
      render :action => 'new'
    end
  end
end
