require 'spec_helper'

describe Grupo do
  it{ should_not have_valid(:republica).when(nil)}

  it "deve saber quem tem o maior saldo" do   
    dbGT = create :grupo

    goku = create :user_confirmado, grupos: [dbGT]
    pan = create :user_confirmado, grupos: [dbGT]
    vegeta = create :user_confirmado, grupos: [dbGT]

    pan.contas.create! nome: 'luz', valor: '300', grupo: dbGT
    pan.contas.create! nome: 'luz', valor: '300', grupo: dbGT
    vegeta.contas.create! nome: 'Agua', valor: '200', grupo: dbGT
    vegeta.contas.create! nome: 'Agua', valor: '300', grupo: dbGT
    goku.contas.create! nome: 'Gas', valor: '100', grupo: dbGT
    goku.contas.create! nome: 'Gas', valor: '300', grupo: dbGT

    dbGT.maior_saldo.should == pan
  end
end
