module WeiboOAuth
  class Client
    
    # weibo 没有的功能
    # Enables device notifications for updates from the specified user.  
    # Returns the specified user when successful.
    def follow(id)
      post("/notifications/follow/#{id}.json")
    end
    
    # Disables notifications for updates from the specified user to the authenticating user.  
    # Returns the specified user when successful.
    def leave(id)
      post("/notifications/leave/#{id}.json")
    end
    
  end
end
