class Legislator < OpenState

  def initialize(options)
    self.configure(options)
  end

  def search(query) 
    self.class.get("#{api_base_path}/legislators/?q=#{query}")
  end

  def lookup(leg_id)
    self.class.get("#{api_base_path}/legislators/#{leg_id}/")
  end

  def geo_lookup(lat,long)
    self.class.get("#{api_base_path}/legislators/geo/?lat=#{lat}&long=#{long}")
  end

end
