require 'sinatra'
require 'data_mapper'

get '/' do
	@notes = Note.all :order => :id.desc
	@title = 'All notes'
	erb :home
end

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/todolist.rb")

class Note
	include DataMapper::Resource
	property :id, Serial
	property :content, Text, :required => true
	property :complete, Boolean, :required => true, default => false
	property :created_at, DateTime
	property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!