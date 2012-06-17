class ContasController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :grupo
  actions :new, :create, :show, :index

  def create
    @conta = Conta.new(params[:conta])
    @grupo = Grupo.find(params[:grupo_id])
    @conta.grupo = @grupo
    @conta.user = current_user

    if @conta.save
      redirect_to grupo_path(@grupo), notice: 'Conta criada com sucesso.'
      RepublicaMailer.enviar_debito_grupo(@grupo, current_user).deliver
    else
      render 'new'
    end
  end
end
