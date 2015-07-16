require 'rails_helper'

describe "User" do

  subject(:user) { User.create }

  it { is_expected.to respond_to :username }
  it { is_expected.to respond_to :email }
  it { is_expected.to have_many :posts }

  describe '#username' do
    subject(:invalid_user) { User.create(username:"", email:"blah@example.com") }

    it { is_expected.to_not be_valid}

    describe 'when it is more than 2 characters' do
      subject(:valid_user) { User.create(username:"Coffeebara", email:"blah@example.com") }

      it {is_expected.to be_valid}
    end

    describe 'when it is fewer than 2 characters' do # thanks Matt!
      it 'should be invalid' do
        invalid_user = User.create(username:"A", email:"blah@example.com")

        expect(invalid_user).to_not be_valid
      end
    end
  end

  describe '#email' do
    it 'should not be blank' do
      invalid_email = User.create(username:"Olaf", email:"")

      expect(invalid_email).to_not be_valid
    end
  end



end
