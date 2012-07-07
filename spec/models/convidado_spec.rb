# encoding: utf-8
require 'spec_helper'

describe Convidado do
  it{ should_not have_valid(:email).when(nil) }
  it{ should_not have_valid(:email).when("nil") }
  it{ should have_valid(:email).when("nil@email.com") }
end
