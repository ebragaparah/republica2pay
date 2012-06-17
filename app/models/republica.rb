class Republica < ActiveRecord::Base
  attr_accessible :nome
  has_many :moradores, class_name: 'User'
  has_many :grupos

  validates_presence_of :nome
end
