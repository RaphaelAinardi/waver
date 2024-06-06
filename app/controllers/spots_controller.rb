class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @spots = Spot.all
  end

  def map
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
    @spot = Spot.find(params[:id])
    @hours = (0..24).to_a.map { |n| (n + Time.now.hour) % 24 }
    @weather_data = GetWeather.new(spot: @spot).call
  end
end
