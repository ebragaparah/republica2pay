require 'spec_helper'

describe Fatura do
  it{ should_not have_valid(:vencimento).when(nil) }
  it{ should_not have_valid(:contas).when([]) }
end
