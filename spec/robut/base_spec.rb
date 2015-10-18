require "spec_helper"

describe Robut::Base do
  subject do
    Class.new { extend Robut::Base }
  end

  it "extends object with Robut's DSL methods" do
    expect(subject).to respond_to(:robut)
  end

  it "initializes an event loop" do
    client_double = double
    client_double.stub(:sign_in)
    subject.stub(:client) { client_double }
    expect(subject).to receive(:initialize_event_loop!)

    subject.class_eval do
      robut("username", "password") {}
    end
  end
end
