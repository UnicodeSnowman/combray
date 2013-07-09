require 'spec_helper'

describe User do
  describe "passwords" do
    it "needs a password and confirmation to save" do
      u = User.new(name: "chris")

      u.save
      expect(u).to_not be_valid

      u.password = "testpass"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "testpass"
      u.save
      expect(u).to be_valid
    end

    it "needs password and confirmation to match" do
      u = User.create(
        name: 'chris',
        password: 'testpass',
        password_confirmation: 'testpassssss'
      )

      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(
      name: 'chris',
      password: 'testpass',
      password_confirmation: 'testpass'
    )}

    it "authenticates with a correct password" do
      expect(user.authenticate('testpass')).to be
    end

    it "does not authenticate with an incorrect password" do
      expect(user.authenticate('testpasssss')).to_not be
    end
  end
end
