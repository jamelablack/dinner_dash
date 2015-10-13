require 'rails_helper'

describe User do

  let(:user) { described_class.new }

  it 'requires a password' do
    expect(user).not_to be_valid
    expect(user.errors[:password]).not_to be_empty
  end

  it 'requires a email' do
    expect(user).not_to be_valid
    expect(user.errors[:email]).not_to be_empty
  end

  it 'requires confirmation of password' do
    user.password = 'foo'
    user.password_confirmation = 'bar'
    expect(user).not_to be_valid
    expect(user.errors[:password_confirmation]).not_to be_empty
  end

end
