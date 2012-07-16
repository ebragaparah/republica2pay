class RepublicaMailer < ActionMailer::Base
  default from: "republica2pay@gmail.com"

  def enviar_fatura_do_mes(fatura)
    @fatura = fatura
    emails = fatura.republica.moradores.map { |morador| morador.email }
    mail(to: emails, 
         subject: "Contas do mes - Total:#{fatura.total}, Por Pessoa:#{fatura.por_pessoa}")
  end

  def enviar_debito_grupo(grupo, conta, morador)
    @grupo = grupo
    @morador = morador
    @conta = conta
    emails = grupo.moradores.map { |morador| morador.email }
    mail(to: emails, 
         subject: "#{morador.email} fez uma compra",
         from: "#{morador.email}")
  end

  def enviar_convite(convite, convidado, user)
    @convite = convite
    @convidado = convidado
    @user = user
    mail(to: convidado.email,
         subject: "#{user.email} te convidou para republica #{user.republica.nome}",
         from: "#{user.email}")
  end
end
