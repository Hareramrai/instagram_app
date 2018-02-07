module WebMockSpecHelper
  def stub_recent_media 
    stub_request(:get, "https://api.instagram.com/v1/users/self/media/recent.json").
      with(  headers: {
        'Accept'=>'application/json; charset=utf-8',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Instagram Ruby Gem 1.1.6'
      }).
      to_return(status: 200, body: recent_media, headers: {})
  end

  def recent_media
    [
      {
        carousel_media: [ 
          { images: { standard_resolution: { url: Faker::Avatar.image } } },
          { images: { standard_resolution: { url: Faker::Avatar.image } } },
        ],
        caption: { text: "This is test caption" }
      },
      {
        images: { standard_resolution: { url: Faker::Avatar.image } } 
      }
    ]
  end
end

