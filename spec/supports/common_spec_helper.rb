module CommonSpecHelper
  def mock_omniauth data={}
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: data[:uid] || "123545",
      extra: { raw_info: { full_name: data[:name] || "Hare Ram Rai" , 
        profile_picture: "default_profile_pic.jpg", 
        username: data[:username] || "hareram" } },
      credentials: { token: data[:token] || "a1s2s3d3f4g4g5h5h"} 
    })
  end
end
