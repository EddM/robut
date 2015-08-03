require "spec_helper"

describe Robut::ListenerCollection do
  let(:listener_collection) { Robut::ListenerCollection.instance }

  it "can be appended to" do
    expect(listener_collection.listeners).to be_empty

    my_double = double
    listener_collection << my_double

    expect(listener_collection.listeners).to_not be_empty
    expect(listener_collection.listeners[0]).to eq(my_double)
  end
end
