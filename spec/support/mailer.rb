def ultimo_email
  ActionMailer::Base.deliveries.last
end

def zerar_email
  ActionMailer::Base.deliveries = []
end

def emails
  ActionMailer::Base.deliveries
end

def lista_de_destinatarios
  emails.map { |email| email.to  }
end