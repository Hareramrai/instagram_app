class ImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @images = InstagramClient.new(current_user).recent_media
  end

end
