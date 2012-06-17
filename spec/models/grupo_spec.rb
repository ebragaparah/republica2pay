require 'spec_helper'

describe Grupo do
  it{ should_not have_valid(:republica).when(nil)}
end
