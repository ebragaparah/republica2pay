class Conta < ActiveRecord::Base
  attr_accessible :nome, :valor, :grupo, :descricao
  belongs_to :fatura
  belongs_to :grupo
  belongs_to :user

  validates_presence_of :nome, :valor
end
