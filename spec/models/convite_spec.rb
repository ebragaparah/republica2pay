require 'spec_helper'

describe Convite do
  it{should_not have_valid(:republica).when(nil)}
  it{should_not have_valid(:convidados).when([])}
end
