require 'spec_helper'

describe Republica do
  it{ should_not have_valid(:nome).when(nil) }
end
