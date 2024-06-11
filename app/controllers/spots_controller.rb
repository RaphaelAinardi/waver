class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    @spots = @spots.where(location: params[:location]) if params[:location].present?
    @spots = @spots.where(wave_type: params[:wave_type]) if params[:wave_type].present?
    @spots = @spots.where(difficulty: params[:difficulty]) if params[:difficulty].present?
    @spots = @spots.order(average_rating: :desc) if params[:average_rating].present?
    if @spots.empty?
      @spots = Spot.all
      flash.alert = "No spots found matching your filters."
    end
  end

  def map
    @spots = Spot.all
    @markers = @spots.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        marker_html: render_to_string(partial: "marker", locals: { spot: }),
        info_window_html: render_to_string(partial: "cards", locals: {spot:})

      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @hours = (0..24).to_a.map { |n| (n + Time.now.hour) % 24 }
    @weather_data = GetWeather.new(spot: @spot).call
  end

  def set_favourite
    @spot = Spot.find(params[:id])
    @favourite = current_user.favourites.find_by(spot: @spot)
    if @favourite
      Favourite.delete(@favourite)
    else
      Favourite.create(user: current_user, spot: @spot)
    end
    head :ok
  end
end
