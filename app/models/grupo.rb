class Grupo < ActiveRecord::Base
  attr_accessible :nome, :morador_ids
  has_many :moradores, class_name: 'User'
  belongs_to :republica
end
