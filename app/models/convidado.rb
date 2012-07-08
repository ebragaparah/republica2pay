class Convidado < ActiveRecord::Base
  attr_accessible :convite_id, :email, :republica_id
  belongs_to :republica

  validates_presence_of :email#, :token
  validates_format_of :email, with: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i

  before_create :gerar_token

  def aceitar_convite(convite)
    User.create email: self.email, password: self.email, republica: convite.republica
    self.destroy
  end

  private

  def gerar_token
    self.token = SecureRandom.hex
  end

end
