require_relative "artist"
require 'active_support/all'
require 'airtable'


class Gallery
  attr_reader :api_key, :app_key, :table
  def initialize(attributes = {})
    @client = Airtable::Client.new(attributes[:api_key])
    @table = @client.table(attributes[:app_key], attributes[:table])
    @artists = @table.records
  end

  def all
    return @artists
  end

  def find(id)
    @artist = @table.find(id)
  end

  # def find_by_name(name)
  #   @artists.each do |artist|
  #     if artist[:name] = name
  #       return artist
  #     end
  #   end
  # end

end


