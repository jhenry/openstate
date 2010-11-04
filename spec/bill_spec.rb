require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Bill do

  before(:each) do
    @bill = Bill.new(@options)
    @state_abbreviation = "vt"
    @query = "agriculture&state=#{@state_abbreviation}"
  end

  it "gets a list of bills based on a keyword" do
    @stub_url = "#{@uri_path}/bills/?q=#{@query}&apikey=#{@api_key}"
    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/bills.agriculture.vt.json'))

    @result = @bill.search(@query)

    WebMock.should have_requested(:get, @stub_url)
    @result[0]["title"].should =~ /agricultur/i
  end

  it "looks up a bill using state, session, and id" do
    session = "2009-2010"
    id = "H.0434"
    @stub_url = "#{@uri_path}/bills/#{@state_abbreviation}/#{session}/#{id}?apikey=#{@api_key}"
    stub_request(:get, @stub_url).to_return(:body => File.new(@responses_path + '/bills.vt.2009-2010.h0434.json'))

    @the_bill = @bill.lookup(@state_abbreviation, "2009-2010", "H.0434")

    WebMock.should have_requested(:get, @stub_url)
    @the_bill["title"].should == "AN ACT RELATING TO AGENCY OF AGRICULTURE, FOOD AND MARKETS REVENUES"
  end

  it "looks up a bill using the chamber"

end
