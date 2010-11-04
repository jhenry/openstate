class Bill < OpenState

  def initialize(options)
    self.configure(options)
  end

  def search(query) 
    self.class.get("#{api_base_path}/bills/?q=#{query}")
  end

  def lookup(state,session, id, chamber="")
    chamber = "/#{chamber}" unless chamber.empty?
    self.class.get("#{api_base_path}/bills/#{state}/#{session}#{chamber}/#{id}")
  end
end

