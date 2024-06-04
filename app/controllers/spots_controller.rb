class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @spot = Spot.new
    @spots_location = @spots.map do |spot|

    end
  end
end
