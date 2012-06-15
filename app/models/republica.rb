class Republica < ActiveRecord::Base
  attr_accessible :nome, :moradores
  has_many :moradores, class_name: 'User'

  validates_presence_of :nome, :moradores
end
