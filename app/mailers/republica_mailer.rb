class RepublicaMailer < ActionMailer::Base
  default from: "republica2pay@gmail.com"

  def enviar_fatura_do_mes(fatura)
    @fatura = fatura
    emails = fatura.republica.moradores.map { |morador| morador.email }
    mail(to: emails, 
         subject: "Contas do mes - Total:#{fatura.total}, Por Pessoa:#{fatura.por_pessoa}")
  end

  def enviar_debito_grupo(grupo, morador)
    @grupo = grupo
    emails = grupo.moradores.map { |morador| morador.email }
    mail(to: emails, 
         subject: "#{morador} fez uma compra")
  end

  def enviar_convite(convite, convidado, user)
    @convite = convite
    @user = user
    mail(to: convidado.email,
         subject: "#{user.email} te convidou para republica #{user.republica.nome}",
         from: "#{user.email}")
  end
end
