require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Legislator do

  before(:each) do
    @legislator = Legislator.new(@options)
    @state_abbreviation = "vt"
  end

  it "gets a list of legislators based on a query" do
    @query = "state=#{@state_abbreviation}&chamber=lower&term=2009-2010&party=Independent"
    @stub_url = "#{@uri_path}/legislators/?q=#{@query}&apikey=#{@api_key}"
    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/legislators.search.json'))

    @result = @legislator.search(@query)

    WebMock.should have_requested(:get, @stub_url)
    @result[0]["party"].should == "Independent"
    @result[0]["state"].should == "vt"
    @result[0]["chamber"].should == "lower"
  end

  it "looks up a legislator based on their Open State Project leg_id" do
    @leg_id = "VTL000540"
    @stub_url = "#{@uri_path}/legislators/#{@leg_id}/?apikey=#{@api_key}"
    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/legislators.lookup.json'))

    @result = @legislator.lookup(@leg_id)

    WebMock.should have_requested(:get, @stub_url)
    @result["leg_id"].should == @leg_id
    @result["last_name"].should == "Zuckerman"


  end
  it "gets a list of legislators based on a lat/long" do
    @lat,@long = "44.484834,-73.211346".split(",")
    @stub_url = "#{@uri_path}/legislators/geo/?lat=#{@lat}&long=#{@long}&apikey=#{@api_key}"
    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/legislators.geo.json'))

    @result = @legislator.geo_lookup(@lat,@long)

    WebMock.should have_requested(:get, @stub_url)
    @result[0]["district"].should =~ /Chittenden/
  end
end

