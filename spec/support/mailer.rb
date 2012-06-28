def ultimo_email
  ActionMailer::Base.deliveries.last
end

def zerar_email
  ActionMailer::Base.deliveries = []
end

