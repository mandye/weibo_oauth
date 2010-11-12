module KmtOAuth
  class Client
    
    # Returns the 20 most recent statuses from non-protected users who have set a custom user icon.
    def public_timeline(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/public_timeline.json?#{args}")
    end
    
    # Returns the 20 most recent statuses, including retweets, posted by the authenticating user and that user's friends. 
    # This is the equivalent of /timeline/home on the Web.
    def home_timeline(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/home_timeline.json?#{args}")
    end
    
    # Returns the 20 most recent statuses posted by the authenticating user and that user's friends.
    def friends_timeline(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/friends_timeline.json?#{args}")
    end
    
    # Returns the 20 most recent statuses posted from the authenticating user.
    def user_timeline(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/user_timeline.json?#{args}")
    end
    alias :user :user_timeline
    
    # Returns the 20 most recent @replies (status updates prefixed with @username) for the authenticating user.
    def mentions(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/mentions.json?#{args}")
    end
    alias :replies :mentions
    
    # Returns the 20 most recent comments posted by the authenticating user
    def comments_by_me(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/comments_by_me.json?#{args}")
    end
    
    # Returns the 20 most recent comments posted by the authenticating user's friends.
    def comments_timeline(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/comments_timeline.json?#{args}")
    end
    
    # Returns the 20 most recent comments of someone.
    def comments(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/statuses/comments.json?#{args}")
    end
    
  end
end
