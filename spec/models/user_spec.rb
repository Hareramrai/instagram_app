require 'rails_helper'

RSpec.describe User, type: :model do
  let(:uid) { 12345 }
  let(:token) { 'abcd12345' }
  let(:auth) { 
    { provider: 'instagram',
      uid: uid,
      extra: { 
        raw_info: { username: 'username', full_name: "Full Name", profile_picture: '' } 
      },
      credentials: { token: token }
    }
  }

  describe '#from_omniauth' do
    context "when user is coming for first time" do 
      it "creates a new user in table" do 
        token = "abcd12345"
        expect { User.from_omniauth(auth.to_dot) }.to change{User.count}.by(1)
      end
    end

    context "when user is already accessed our application" do
      let(:uid) { 54321 }
      let(:token) { "12345abcd" }
      before { create(:user, uid: uid) }
      it "updates the exisiting user in table" do 
        auth[:uid] = uid
        auth[:credentials][:token] = token
        expect(User.from_omniauth(auth.to_dot).token).to eq(token)
      end
    end

  end
end