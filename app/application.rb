class Application
end

class Application
 
  @@songs = [Song.new("Sorry", "Justin Bieber"),
            Song.new("Hello","Adele")]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/songs/)
 
      song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    end
 
    resp.finish
  end
end

class Application
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/songs"
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end