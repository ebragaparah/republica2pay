class FaturasController < InheritedResources::Base
  load_and_authorize_resource

  def create
    @fatura = Fatura.new(params[:fatura])
    @fatura.republica = current_user.republica

    if @fatura.save
      redirect_to fatura_path(@fatura), notice: 'Fatura Criada com sucesso.'
    else
      render 'new'
    end
  end
end
