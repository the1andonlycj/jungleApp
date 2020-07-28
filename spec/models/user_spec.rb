require 'rails_helper'

RSpec.describe User, type: :model do
# different style of testing here:

  describe "Validations" do
    it "should create a valid user" do
      user = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "bobbert@test.com",
        password: "testy",
        password_confirmation: "testy"
        )
        expect(user).to be_valid
    end

    it "should have matching password and password confirmation inputs" do
      user = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "bobbert@test.com",
        password: "testy",
        password_confirmation: "testy"
        )
      expect(user.password).to eq(user.password_confirmation)
    end

    it "should not create an user if the email exists" do
      user1 = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "bobbert@test.com",
        password: "testy",
        password_confirmation: "testy"
        )
      user2 = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "bobbert@test.com",
        password: "testy",
        password_confirmation: "testy"
        )
      # check database for matching 
      # expect(user1.valid?).to eq(true)
      expect(user2.valid?).to eq(false)
    end
  end

  describe '.authenticate_with_credentials' do
    it "returns user if it exists" do
      user1 = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "bobbert@test.com",
        password: "testy",
        password_confirmation: "testy"
        )
      user2 = User.authenticate_with_credentials("bobbert@test.com", "testy")
      expect(user2).to eq(user1)
    end

    it "doesn't return user if password does not match" do
      user1 = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "bobbert@test.com",
        password: "testy",
        password_confirmation: "testy"
        )
      user2 = User.authenticate_with_credentials("bobbert@test.com", "12testy")
      expect(user2).to eq(nil)
    end

    it "logs in even if there's whitespace around the user email" do
      user1 = User.create(
        first_name: "Bobbert",
        last_name: "Bobbins",
        email: "  bobbert@test.com  ",
        password: "testy",
        password_confirmation: "testy"
        )
      expect(user1.valid?).to eq(true)
    end
  end
end



# when checking email, we should automatically downcase it: .downcase so we 
# can compare it all without worrying about whether or not the case matches.