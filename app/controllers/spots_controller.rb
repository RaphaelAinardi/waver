class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @spots = Spot.all
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        marker_html: render_to_string(partial: "marker", locals: { spot: })
      }
    end
  end

  def show
  end
end
