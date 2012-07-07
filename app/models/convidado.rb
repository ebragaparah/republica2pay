class Convidado < ActiveRecord::Base
  attr_accessible :convite_id, :email, :republica_id
  belongs_to :republica

  validates_presence_of :email
  validates_format_of :email, with: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
end
