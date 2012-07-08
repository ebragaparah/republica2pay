require 'spec_helper'

describe User do
  before(:each) do
    @user = create :user_confirmado
  end

  it "deveria criar apenas uma republica" do
    republica = @user.criar_republica(nome: 'republica1')
    User.first.republica.should == republica
    @user.criar_republica(nome: 'republica2').should be_nil
  end

  it "deveria ser capaz de entrar/mudar de republica" do
    republica = create :republica

    @user.republica = republica
    @user.save
    
    User.first.republica.should == republica
  end

  context "contas" do
    before(:each) do
      republica = create :republica
     
      @dbGT = create :grupo, republica: republica
      @dragonball = create :grupo, republica: republica

      @goku = create :user_confirmado, republica: republica, grupos: [@dbGT, @dragonball]
      @pan = create :user_confirmado, republica: republica, grupos: [@dbGT]

      @pan.contas.create! nome: 'luz', valor: '100', grupo: @dbGT
      @pan.contas.create! nome: 'Agua', valor: '200', grupo: @dbGT
      @goku.contas.create! nome: 'Gas', valor: '100', grupo: @dbGT
      
      @goku.contas.create! nome: 'Gas', valor: '100', grupo: @dragonball
    end  
    
    it "deve saber o seu total q gastou em um grupo" do
      @pan.total_gasto_em(@dbGT).should == 300
      @goku.total_gasto_em(@dbGT).should == 100

      @goku.total_gasto_em(@dragonball).should == 100
      @pan.total_gasto_em(@dragonball).should == 0
    end

    it "deve saber o seu debito em um grupo" do
      @goku.debito_em(@dbGT).should == 200
      @pan.debito_em(@dbGT).should == 0

      @goku.debito_em(@dragonball).should == 0
      @pan.debito_em(@dragonball).should == 100
    end
  end

  describe "#enviar_convite" do
    it "deveria enviar email para os convidados do convite individualmente" do
      zerar_email
      @user.republica = create(:republica)
      3.times {create :convidado}
      
      @user.enviar_convite create(:convite, convidados: Convidado.all)

      lista_de_destinatarios.should == Convidado.all.map { |convidado| [convidado.email] } #array de array, pq é padrão do mailer
    end
  end
  
end
