class FaturasController < InheritedResources::Base
  load_and_authorize_resource
  def create
    create!(notice: 'Fatura Criada com sucesso.')
  end
end
