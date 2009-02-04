require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  set  :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  puts e.to_s
  puts e.backtrace.join('\n')
  'Application error'
end

helpers { include ApplicationHelper }

# root page
get '/' do 
  @statuses = Status.random(SiteConfig.status_length, :created_at.gte => Time.now - 86400)
  haml :main
end

# random partials for reloading
get '/random' do
  @statuses = Status.random(SiteConfig.status_length, :created_at.gte => Time.now - 86400)
  @statuses.map { |s| haml :show, :locals => { :status => s }, :layout => false }.join('')
end
