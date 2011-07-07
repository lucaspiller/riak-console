require 'rubygems'
require 'riak/client'
require 'pp'

def client()
  $client ||= Riak::Client.new(:protocol => :pbc)
end

def get(*args)
  case args.size
  when 2
    bucket, key = args
    object = client.bucket(bucket).get(key)
    puts "content-type: " + object.content_type
    puts "vclock: " + object.vclock
    puts "etag: " + object.etag
    puts "last_modified: " + object.last_modified.to_s
    puts "links:"
    object.links.each do |link|
      puts " - bucket: " + link.bucket
      puts "   key: " + link.key
      puts "   tag: " + link.tag
    end
    puts "data:"
    pp object.data
    true
  else
    puts "error usage: get bucket key"
    false
  end
rescue Riak::ProtobuffsFailedRequest => e
  puts e.message
  false
end


def put(*args)
  case args.size
  when 3
    bucket, key, value = args
    object = client.bucket(bucket).get_or_new(key)
    object.content_type = 'application/x-ruby-marshal'
    object.data = value
    object.store
    true
  when 4
    bucket, key, value, type = args
    object = client.bucket(bucket).get_or_new(key)
    object.content_type = type
    object.data = value
    object.store
    true
  else
    puts "error usage: put bucket key value [content_type]"
  end
end

def list(*args)
  case args.size
  when 0
    puts "Warning this will take a while, try usage: list [buckets]"
    result = client.buckets.inject({}) do |hash, bucket|
      hash[bucket.name] = bucket.keys
      hash
    end
    puts result.to_yaml
    true
  else
    result = args.inject({}) do |hash, bucket|
      hash[bucket] = client.bucket(bucket).keys
      hash
    end
    puts result.to_yaml
    true
  end
end
