require 'spec_helper'

describe Conta do
  it{ should_not have_valid(:nome).when(nil)}
  it{ should_not have_valid(:valor).when(nil)}
end
