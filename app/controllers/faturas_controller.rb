class FaturasController < InheritedResources::Base
  def create
    create!(notice: 'Fatura Criada com sucesso.')
  end
end
