class HomeController < ApplicationController
  def index
    @images = %w( 01 02 04 06 07 08 09 10 11 12)
  end
end
