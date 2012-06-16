class Fatura < ActiveRecord::Base
  attr_accessible :por_pessoa, :total, :vencimento, :contas_attributes, :contas, :republica
  has_many :contas
  belongs_to :republica

  accepts_nested_attributes_for :contas, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :vencimento, :contas

  after_create :fechar_fatura

  private
  def fechar_fatura
    self.total = self.contas.reduce(0){|total, conta| total += conta.valor}
    self.por_pessoa = self.total / self.republica.moradores.count
    self.save
  end
end
