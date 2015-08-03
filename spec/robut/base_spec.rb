require "spec_helper"

describe Robut::Base do
  subject do
    Class.new { extend Robut::Base }
  end

  it "further extends object with Robut's other base-level methods" do
    expect(subject.singleton_class.included_modules).to include(Robut::Actions)
    expect(subject.singleton_class.included_modules).to include(Robut::Listeners)
  end

  it "initializes an event loop" do
    client_double = double
    client_double.stub(:sign_in)
    subject.stub(:client) { client_double }
    expect(subject).to receive(:initialize_event_loop!)

    subject.class_eval do
      robut("username", "password") { }
    end
  end
end
