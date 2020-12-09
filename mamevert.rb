#!/usr/bin/env ruby
# frozen_string_literal: true

#
# This requires nokogiri to parse the XML file so you
# might need to do:
#   sudo apt install ruby-nokogiri
#


require 'nokogiri'

# A class to parse MAME xml
class MameFilter < Nokogiri::XML::SAX::Document
  def start_document
    @units = []
    @items = []
  end

  def start_element(name, attrs = [])
    case name
    when 'machine'
      attrs = attrs.to_h
      @machine = attrs['name']

    when 'display'
      attrs = attrs.to_h
      if attrs['tag'].start_with?('screen') &&
         %w[270 90].include?(attrs['rotate'])
        puts @machine
      end
    end
  end
end

parser = Nokogiri::XML::SAX::Parser.new(MameFilter.new)
input = ARGV[0].nil? ? $< : File.new(ARGV[0],"r")
parser.parse(input)
