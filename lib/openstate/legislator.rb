class Legislator < OpenState
  def search(query) 
    response = Net::HTTP.get(api_host, "#{api_base_path}/legislators/?q=#{query}&apikey=#{api_key}")
    JSON.parse(response)
  end

  def lookup(leg_id)
    response = Net::HTTP.get(api_host, "#{api_base_path}/legislators/#{leg_id}/?apikey=#{api_key}")
    JSON.parse(response)
  end

  def geo_lookup(lat,long)
    response = Net::HTTP.get(api_host, "#{api_base_path}/legislators/geo/?lat=#{lat}&long=#{long}&apikey=#{api_key}")
    JSON.parse(response)
  end

end
