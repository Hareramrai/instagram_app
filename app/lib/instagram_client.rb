 class InstagramClient

  attr_reader :client
  
  def initialize user, klass='Instagram'
    @user = user
    @client = klass.constantize.client(access_token: @user.token)
  end

  def recent_media
    @client.user_recent_media
  end

 end