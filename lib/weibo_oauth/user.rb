module WeiboOAuth
  class Client
    
    # def show(params)
    #   args = params.map{|k,v| "#{k}=#{v}"}.join('&')
    #   get("/users/show.json?#{args}")
    # end
     
    # Returns the 100 last friends
    # The page parameter is implemented for legacy reasons, but use of this is slow
    # as passing page is no longer supported by the Twitter API as the use of cursors
    # is now obligitory. It is recommended that you use all_friends instead
    def friends(params={})
      args = params.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/friends.json?#{args}")
    end 
    
    # Returns the 100 last followers
    def followers(params={})
      args = params.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/followers.json?#{args}")
    end
    
    # /users/suggestions.format
    def user_suggestions(params)
      args = params.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/users/suggestions.json?#{args}")
    end

  end
end
