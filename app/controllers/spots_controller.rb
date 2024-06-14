class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    @spots = @spots.where(wave_type: params[:wave_type]) if params[:wave_type].present?
    @spots = @spots.where(difficulty: params[:difficulty]) if params[:difficulty].present?
    if @spots.empty?
      @spots = Spot.all
      flash.alert = "No spots found matching your filters."
    end

    respond_to do |format|
      format.html
      @cards = render_to_string(partial: "spots/spot_cards", locals: { spots: @spots }, formats: [:html])
      format.json { render json: { html: @cards } }
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
    @url = ENV['LIVECAM_URL']
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
