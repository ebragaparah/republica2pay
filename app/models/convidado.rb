class Convidado < ActiveRecord::Base
  attr_accessible :convite_id, :email, :republica_id
  belongs_to :republica
end
