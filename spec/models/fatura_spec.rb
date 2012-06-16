# encoding: utf-8
require 'spec_helper'

describe Fatura do
  it{ should_not have_valid(:vencimento).when(nil) }
  it{ should_not have_valid(:contas).when([]) }

  it "deveria calcular o total das contas e por usuario da republica, apos a sua criação" do
    republica = create :republica, nome: 'Foo'
    3.times {create :user, republica: republica}
    3.times {create :conta, valor: 100}
    Fatura.create vencimento: Date.today, contas: Conta.all, republica: republica
    
    Fatura.first.total.should == 300
    Fatura.first.por_pessoa.should == 100
  end
end
