require "spec_helper"

describe Robut::Configuration do
  it "raises if no username provided at instantiation" do
    expect do
      Robut::Configuration.new(password: "supersecretpassword")
    end.to raise_error("You must provide both a username and a password")
  end

  it "raises if no password provided at instantiation" do
    expect do
      Robut::Configuration.new(username: "bobbytables")
    end.to raise_error("You must provide both a username and a password")
  end

  it "delegates accessor methods to known attribute keys" do
    config = Robut::Configuration.new(username: "bobbytables",
                                      password: "supersecretpassword",
                                      pineapples: "tasty")

    expect(config.pineapples).to eq("tasty")
  end

  it "raises NoMethodError if method does not match an attribute" do
    config = Robut::Configuration.new(username: "bobbytables",
                                      password: "supersecretpassword",
                                      pineapples: "tasty")

    expect { config.coconuts }.to raise_error(NoMethodError)
  end
end
