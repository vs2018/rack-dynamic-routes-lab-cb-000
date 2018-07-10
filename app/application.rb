class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
      if req.path.match(/items/)
      item = req.path.split("/items/").last 
      result = @@items.find{|s| s.name == item}
          if result != nil
            resp.write result.price
          else
           resp.write "Item not found"
           resp.status = 400
          end
      else
      resp.write "Route not found"
      resp.status = 404
      end
 
    resp.finish
  end
  
end
