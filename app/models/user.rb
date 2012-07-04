class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  belongs_to :republica
  has_and_belongs_to_many :grupos
  has_many :contas

  def criar_republica(params)
    if self.republica.nil?
      republica = self.create_republica(params)
      self.save
      return republica
    else
      return nil
    end
  end

  def entrar_em(republica)
    self.republica = republica
    self.save
  end

  def debito_em(grupo)
    (self.total_gasto_em(grupo) - Grupo.find(grupo).maior_saldo.total_gasto_em(grupo)).abs
  end

  def total_gasto_em(grupo)
    self.contas_em(grupo).reduce(0){|total, conta| total += conta.valor}
  end

  def contas_em(grupo)
    Grupo.find(grupo).contas.select{|conta| conta.user == self}
  end

  def enviar_fatura(fatura)
    RepublicaMailer.enviar_fatura_do_mes(fatura).deliver
  end

  def enviar_debito_grupo(grupo)
    RepublicaMailer.enviar_debito_grupo(grupo, self).deliver
  end

  def enviar_convite(convite)
    RepublicaMailer.enviar_convite_de(convite,self).deliver
  end
end
