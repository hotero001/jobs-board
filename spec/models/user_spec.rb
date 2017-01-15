require 'rails_helper'
require 'spec_helper'

describe User do
  it "requires that the truth is out there" do
    assert true == true
  end

  it "saves the user" do
    user = User.new(name: "dave", email: "dave@msn.com", password_digest: '12345')
    user.save
    expect(User.count).to eq(1)
  end
end