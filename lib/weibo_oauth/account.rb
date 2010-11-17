module WeiboOAuth
  class Client
    
    # Returns an HTTP 200 OK response code and a representation of the requesting user if authentication was successful; 
    # returns a 401 status code and an error message if not.
    def authorized?
      oauth_response = access_token.get('/account/verify_credentials.json')
      return oauth_response.class == Net::HTTPOK
    end
    
    # Returns client info
    def info
      get('/account/verify_credentials.json')
    end
    
    def end_session
      post('/account/end_session.json')
    end
    
    # Returns the remaining number of API requests available to the requesting user before the API limit is reached for the current hour.
    def rate_limit_status
      get('/account/rate_limit_status.json')
    end
    
  end
end
