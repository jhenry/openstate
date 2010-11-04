class Committee < OpenState
  
  def initialize(options)
    self.configure(options)
  end

  def search(query)
    self.class.get("#{api_base_path}/committees/?#{query}")
  end

  def lookup(committee_id)
    self.class.get("#{api_base_path}/committees/#{committee_id}/")
  end
end
