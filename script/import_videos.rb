#!/usr/bin/env ruby
=begin
Usage:
ruby import_videos.rb <path/to/video.csv> [environment]

csv file format:
line 1: ____, ____, Link to original video, ___, ___
line 2: ____, ____, <khan academy video link>, ____, ____
line 3: ____, ____, <khan academy video link>, ____, ____

Notes: -First line should have field names, used to find index
        for khan academy links
       -Title, Course, Subject are all filled in based on khan academy url
       -Amara id is scraped from web page
       -Automatically puts videos as untranslated, unassigned
=end


ENV['RAILS_ENV'] = ARGV[1] || 'development'
require '../config/environment.rb'

require 'nokogiri'
require 'open-uri'
require 'cgi'
require 'csv'

flag=true
link_index = -1
puts ARGV[0]
CSV.foreach(ARGV[0]) do |row|
  if flag
    row.each_with_index do |field, i|
      if field.downcase == "link to original video"
        link_index = i
        break
      end
    end
    flag=false
    next
  end
  if link_index == -1
    puts "Could not find original video link field"
    exit
  end
  begin
    khan_url = row[link_index]

    doc = Nokogiri::HTML(open(khan_url))
    #Grab youtube url given link
    #puts doc.text

    a=doc.css('iframe')#/.*/.match(doc.text)
    #puts "#{a[0]}"
    youtube_id = /data-youtubeid="([^"]*)"/.match("#{a[0]}")[1]
    youtube_url = "\"http://www.youtube.com/watch?v=#{youtube_id}\""
    escaped_url = CGI::escape(youtube_url)
    #escaped_url='%22http%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3D5FBDqY41GjU%22'
    video_url = "https://www.amara.org/widget/rpc/jsonp/show_widget?video_url=#{escaped_url}&is_remote=true"
    doc = Nokogiri::HTML(open(video_url))
    #puts CGI::unescape(escaped_url)
    amara_id = /"video_id"[^"]*"([^"]*)"/.match(doc.text)[1]
    fields = khan_url.split('/')
    title =  fields[-1].gsub(/[-_]/, ' ')
    title = CGI::unescape(title.sub(title[0],title[0].capitalize))
    course = fields[-3].gsub(/[-_]/, ' ')
    course = CGI::unescape(course.sub(course[0],course[0].capitalize))
    subject = fields[-4].gsub(/[-_]/, ' ')
    subject = CGI::unescape(subject.sub(subject[0],subject[0].capitalize))
    wee={:video_id => amara_id,
      :subject => subject,
      :course => course,
      :title => title,
      :translate_progress => false,
      :type_progress => false,
      :qa_progress => false,
      :translate_complete => false,
      :type_complete => false,
      :qa_complete => false
    }
    puts wee
    v = Video.create(wee)

  rescue
    next
  end
end
  # => Nokogiri::HTML::Document
  #puts doc.css('.unisubs-subtitleHomepage').text
  # => Nokogiri::XML::NodeSet
=begin
     row_data = doc.css('.table.draggable.table-striped.table-hover tr.strong td').map do |tdata|
      tdata.text
    end
=end

