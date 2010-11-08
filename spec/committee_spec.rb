require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Committee do

  it "finds a list of committees based on a query" do
    @committee = Committee.new(@options)
    @query = "state=la&chamber=upper"
    @stub_url = "#{@uri_path}/committees/?#{@query}&apikey=#{@api_key}"
    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/committees.search.json'))

    @result = @committee.search(@query)

    WebMock.should have_requested(:get, @stub_url)
    @result[0]["state"].should == "la"
    @result[0]["chamber"].should == "upper"

  end


  it "looks up a committee using it's Open State Project ID" do
    @committee = Committee.new(@options)
    @committee_id = "LAC000012"
    @stub_url = "#{@uri_path}/committees/#{@committee_id}/?apikey=#{@api_key}"

    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/committees.lookup.json'))

    @result = @committee.lookup(@committee_id)

    WebMock.should have_requested(:get, @stub_url)
    @result["committee"] == "Local & Municipal Affairs"
  end

  it "raises an error if no committees are found"

end
