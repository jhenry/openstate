class StateMetadata < OpenState

  def initialize(options)
    self.configure(options)
  end
  
  def fetch_metadata(abbreviation)
    self.class.get("#{api_base_path}/metadata/#{abbreviation}/")
  end

end

