require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-serializer'
require 'dm-migrations'
require 'haml'
require 'ostruct'
require 'twitter'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title           => 'They Are Landing',
                 :search_keywords => ['ufo -listening -playing -band', 'ufos -listening -playing -band', 'exopolitic', 'exopolitics', 'strieber', 'extraterrestrial', 'extraterrestrials'],
                 :status_length   => 50
               )

  DataMapper.setup(:default, ENV['DATABASE_URL']  || "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db")

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end

# prevent Object#id warnings
Object.send(:undef_method, :id)
