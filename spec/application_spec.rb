require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  before(:each) do
    @status = mock('Status', :created_at => Time.now, :null_object => true)
    @status.stub!(:text).and_return("Here is some text")
  end

  specify "should show the default index page" do
    get '/'
    @response.should be_ok
    @response.body.should match(/#{SiteConfig.title}/)
  end

  specify 'should show random statuses' do
    Status.should_receive(:random).and_return([@status, @status])
    get '/'
    @response.should be_ok
    @response.should have_tag('li', /#{@status.text}/, :count => 2)
  end

  specify 'should return a partial with random tweets' do
    Status.should_receive(:random).and_return([@status, @status])
    get '/random'
    @response.should be_ok
    @response.should have_tag('li', /#{@status.text}/, :count => 2)
  end
end
