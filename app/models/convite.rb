class Convite < ActiveRecord::Base
  attr_accessible :mensagem, :convidados_attributes
  has_many :convidados
  accepts_nested_attributes_for :convidados, :reject_if => :all_blank, :allow_destroy => true
end
