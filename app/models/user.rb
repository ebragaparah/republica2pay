class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  belongs_to :republica

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
end
