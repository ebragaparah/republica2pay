class Fatura < ActiveRecord::Base
  attr_accessible :por_pessoa, :total, :vencimento, :contas_attributes
  has_many :contas
  accepts_nested_attributes_for :contas, :reject_if => :all_blank, :allow_destroy => true

  validates_presence_of :vencimento, :contas
end
