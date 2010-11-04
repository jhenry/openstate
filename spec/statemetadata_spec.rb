require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe StateMetadata do 

  before(:each) do
    @state_abbreviation = "vt"
    @state = StateMetadata.new(@options)

    @stub_url = "#{@uri_path}/metadata/#{@state_abbreviation}/?apikey=#{@api_key}" 
    stub_request(:get, @stub_url).to_return(:body => File.new('responses/state.metadata.json'))

    @metadata = @state.fetch_metadata(@state_abbreviation)
  end

  it "makes a request for state medatada to the data service" do
    WebMock.should have_requested(:get, @stub_url)
  end

  it "has retrieved the metadata" do 
    @metadata["abbreviation"].should == @state_abbreviation
  end

  it "gets a state name from requested state metadata" do
    @metadata["name"] == "Vermont"
  end

end
