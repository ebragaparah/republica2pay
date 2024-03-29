class Grupo < ActiveRecord::Base
  attr_accessible :nome, :morador_ids
  has_and_belongs_to_many :moradores, class_name: 'User'
  belongs_to :republica

  has_many :contas
  validates_presence_of :republica

  def maior_saldo
    self.moradores.sort_by{|morador| morador.total_gasto_em(self)}.last
  end
end
