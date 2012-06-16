class FaturasController < InheritedResources::Base
  load_and_authorize_resource

  def create
    @fatura = Fatura.new(params[:fatura])
    @fatura.republica = current_user.republica

    if @fatura.save
      redirect_to fatura_path(@fatura), notice: 'Fatura Criada com sucesso.'
      RepublicaMailer.enviar_fatura_do_mes(@fatura).deliver
    else
      render 'new'
    end
  end
end
