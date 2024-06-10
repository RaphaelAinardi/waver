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
      end: (Time.now.beginning_of_hour + 1.day - 1.hour).iso8601, #Date.today.to_time.end_of_day.iso8601,
      params: "swellPeriod,swellDirection,waveHeight,seaLevel,currentDirection,currentSpeed,windDirection,windSpeed,waterTemperature,cloudCover",
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
      el[data_key]['sg'] if Time.parse(el['time']) > Time.now
    end
    return data_key_restults.compact
  end

  def final_results
    ["swellPeriod", "swellDirection", "waveHeight", "current", "wind", "waterTemperature", "cloudCover", "seaLevel"].map do |key|
      if key == "current"
        ["current", gather_data("currentDirection").map.with_index { |value, index| [value, gather_data("currentSpeed")[index]] }]
      elsif key == "wind"
        ["wind", gather_data("windDirection").map.with_index { |value, index| [value, gather_data("windSpeed")[index]] }]
      else
        [key.underscore, gather_data(key)]
      end
    end.to_h
  end
end
