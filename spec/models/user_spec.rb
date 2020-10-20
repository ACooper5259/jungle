require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   
    xit 'a User with matching passwords and other valid attributes is valid' do
      @user = User.new(email: "test@test.com", first_name: "test_first", last_name: "test_last", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    xit 'a User without matching passwords but other valid attributes is NOT valid' do
      @user = User.new(email: "test@test.com", first_name: "test_first", last_name: "test_last", password: "password", password_confirmation: "different")
      expect(@user).not_to be_valid
    end
    
    xit 'a User with an empty password AND password confirmation but other valid attributes is NOT valid' do
      @user = User.new(email: "test@test.com", first_name: "test_first", last_name: "test_last", password: "", password_confirmation: "")
      expect(@user).not_to be_valid
    end

    xit 'a User with email value of NIL is NOT valid' do
      @user = User.new(email: nil, first_name: "test_first", last_name: "test_last", password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
    end

    xit 'a User with first_name value of NIL is NOT valid' do
      @user = User.new(email: "test@test.com", first_name: nil, last_name: "test_last", password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
    end

    xit 'a User with last_name value of NIL is NOT valid' do
      @user = User.new(email: "test@test.com", first_name: "test_first", last_name: nil, password: "password", password_confirmation: "password")
      expect(@user).not_to be_valid
    end
    
    xit "a User with an non-unique email is NOT valid" do
      
      @user = User.create(email: "test@test.com", first_name: "test_first", last_name: "test_last", password: "password", password_confirmation: "password")
  
      @user2 = User.new(email: "test@test.com", first_name: "first", last_name: "last", password: "password1", password_confirmation: "password1")
      expect(@user2).not_to be_valid
    end

    xit 'a User with password of less than 6 chars or more than 40 chars is NOT valid' do
      @user = User.create(email: "test@test.com", first_name: "test_first", last_name: "test_last", password: "pass", password_confirmation: "pass")
      expect(@user).not_to be_valid
    end
    
  end

  describe '.authenticate_with_credentials' do

    it 'authenticates a user even with extra blank spaces in the email address' do
      @user1 = User.create!(email: "test@test.com", first_name: "test_first", last_name: "test_last", password: "password", password_confirmation: "password")
    
      expect(User.authenticate_with_credentials("  test@test.com" , "password" )).not_to be_nil
    end
    
    it 'a User registered an email with capital letters, a user with the same email but no caps is invalid' do
      @user = User.create(email: "TesT@TEst.com", first_name: "test_first", last_name: "test_last", password: "password", password_confirmation: "password")
    
      @user2 = User.new(email: "test@test.com", first_name: "first", last_name: "last", password: "password1", password_confirmation: "password1")
      expect(@user2).not_to be_valid
    end
  end
end

