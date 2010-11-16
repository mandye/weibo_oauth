module WeiboOAuth
  class Client
    
    # Return the most recent direct messages sent to the authenticating user.
    # for other options
    def messages(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/direct_messages.json?#{args}")
    end
    
    # By default, returns a list of the 20 most recent direct messages sent by the authenticating user.
    def sent_messages(options={})
      args = options.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/direct_messages/sent.json?#{args}")
    end
    
    # Sends a new direct message to the specified user from the authenticating user.
    def message(user, text)
      if user.to_i > 0
        post('/direct_messages/new.json', :user_id => user, :text => text)
      else
        post('/direct_messages/new.json', :screen_name => user, :text => text)
      end
    end
    
    # Destroys the direct message specified in the required ID parameter.
    def message_destroy(id)
      post("/direct_messages/destroy/#{id}.json")
    end
    
  end
end
