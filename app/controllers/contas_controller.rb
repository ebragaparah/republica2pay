class ContasController < InheritedResources::Base
  actions :new, :create

  def create
    create!(notice: 'Conta criada com sucesso.'){new_conta_path}
  end
end
