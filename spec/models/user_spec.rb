require 'rails_helper'

RSpec.describe User, type: :model do
  subject! { User.create(first_name: 'test_name', last_name: 'test_name', email: 'aaa@gg.com', password: 'hhhhhh', password_confirmation: 'hhhhhh') }
  describe 'Validations' do
    it 'User should save' do
      expect(subject).to be_valid
    end

    it 'User should throw an error if password_confirmation does not match' do
      subject.password_confirmation = 'gggggg'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it 'User should throw an error if password_confirmation is nil' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end

    it 'User should throw an error if password is nil' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Password can't be blank"])
    end

    it 'User should throw an error if password is less than 6 characters' do
      subject.password = 'gg'
      subject.password_confirmation = 'gg'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to eq(["Password is too short (minimum is 6 characters)"])
    end

    it 'User should throw an error if email is already in database' do
      user = User.create(first_name: 'test_name', last_name: 'test_name', email: 'aAa@gg.com', password: 'hhhhhh', password_confirmation: 'hhhhhh')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to eq(["Email has already been taken"])
    end
  end

  describe '.authenticate_with_credentials' do

    it 'Sign a user in with a valid email and password' do
      user = User.authenticate_with_credentials('aaa@gg.com', 'hhhhhh')
      expect(subject).to eq user
    end

    it "Throw an error if email doesn't exist" do
      user = User.authenticate_with_credentials('aa@gg.com', nil)
      expect(user).to eq nil
    end

    it 'Throw an error if password does not match' do
      user = User.authenticate_with_credentials('aaa@gg.com', 'fft65')
      expect(user).to eq nil
    end

    it 'Sign a user in with a valid email with spaces around it and valid password' do
      user = User.authenticate_with_credentials('  aaa@gg.com ', 'hhhhhh')
      expect(subject).to eq user
    end

    it 'Sign a user in with a valid email with lower and upper case and valid password' do
      user = User.authenticate_with_credentials('aAa@gg.com', 'hhhhhh')
      expect(subject).to eq user
    end
    
  end
end
