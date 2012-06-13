class Conta < ActiveRecord::Base
  attr_accessible :nome, :valor
  belongs_to :fatura

  validates_presence_of :nome, :valor
end
