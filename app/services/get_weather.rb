class GetWeather
  def initialize(spot:)
    @spot = spot
  end

  def call
    @connection = Faraday.new(
      url: nil,
      params: params,
      headers: headers
    )
    response = @connection.get("https://api.stormglass.io/v2/weather/point")

    if response.success?
      @results = JSON.parse(response.body)["hours"]
      return final_results
    else
      puts "Call API failed"
    end
  end

  # private

  def params
    {
      lat: @spot.latitude,
      lng: @spot.longitude,
      # start: Time.now.beginning_of_day.iso8601,
      end: (Time.now.beginning_of_hour + 1.day).iso8601, #Date.today.to_time.end_of_day.iso8601,
      params: "cloudCover,currentDirection,currentSpeed,seaLevel,swellDirection,swellPeriod,waveHeight,windDirection,windSpeed,waterTemperature",
    }
  end

  def headers
    {
      'Authorization': ENV["STORMGLASS_API_KEY"],
      'Content-Type': 'application/json'
    }
  end

  def gather_data(data_key)
    data_key_restults = @results.map do |el|
      { Time.parse(el['time']) => el[data_key]['sg'] } if Time.parse(el['time']) > Time.now
    end
    return data_key_restults.compact
  end

  def final_results
    ["cloudCover", "currentDirection", "currentSpeed", "seaLevel", "swellDirection", "swellPeriod", "time", "waterTemperature", "waveHeight", "windDirection", "windSpeed"].map do |key|
      [key.underscore, gather_data(key)]
    end.to_h
  end
end
