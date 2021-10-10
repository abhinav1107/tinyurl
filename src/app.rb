require 'sinatra'
require 'redis'

set :bind, '0.0.0.0'
redis = Redis.new(host: ENV["REDIS_HOST"], port: ENV["REDIS_PORT"])

get "/:url" do
  url_hash = params['url']
  unless redis.exists?(url_hash)
    halt 418, "I am a teapot\n"
  end
  redirect redis.get(url_hash)
end

get "/" do
  "make a get or post with short URL\n"
end

post "/" do
  url = request.body.read
  url = url.strip
  uri = URI.parse(url)
  if uri.is_a?(URI::HTTP) && !uri.host.nil?
    url_hash = (Time.now.to_f).to_i.to_s(36)
    redis.set(url_hash, url)
    "The Shortend URL is: #{request.url}#{url_hash}\n"
  else
    halt 422, "It doesn't look like a valid URL: #{url}\n"
  end
end
