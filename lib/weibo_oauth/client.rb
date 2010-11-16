require 'pp'

require 'weibo_oauth/timeline'
require 'weibo_oauth/status'
require 'weibo_oauth/account'
require 'weibo_oauth/direct_messages'
require 'weibo_oauth/search'
require 'weibo_oauth/notifications'
require 'weibo_oauth/blocks'
require 'weibo_oauth/friendships'
require 'weibo_oauth/user'
require 'weibo_oauth/favorites'
require 'weibo_oauth/utils'
require 'weibo_oauth/trends'
require 'weibo_oauth/lists'
require 'weibo_oauth/saved_searches'
require 'weibo_oauth/spam'

module WeiboOAuth
  class Client
    
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @site = options[:site]
      @token = options[:token]
      @secret = options[:secret]
    end
  
    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(
        consumer, token, secret
      )
      @access_token = request_token.get_access_token(options)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end
  
    def show(params)
      if params[:screen_name]
        params[:screen_name] = URI.escape(params[:screen_name])
      end
      args = params.map{|k,v| "#{k}=#{v}"}.join('&')
      get("/users/show.json?#{args}")
    end
    
    # Returns the string "ok" in the requested format with a 200 OK HTTP status code.
    def test
      get("/help/test.json")
    end
    
    def request_token(options={})
      consumer.get_request_token(options)
    end
    
    def authentication_request_token(options={})
      consumer.options[:authorize_path] = '/oauth/authenticate'
      request_token(options)
    end
    
    private
      def consumer
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          { :site => @site || "http://api.t.sina.com.cn" }
        )
      end

      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end
      
      def get(url)
        oauth_response = access_token.get(url)
        # pp safe_parse(oauth_response.body)
        safe_parse(oauth_response.body)
      end

      def post(url, body = '', headers = {})
        oauth_response = access_token.post(url, body, headers)
        safe_parse(oauth_response.body)
      end

      def delete(url)
        oauth_response = access_token.delete(url)
        safe_parse(oauth_response.body)
      end
      
      def safe_parse(resp_body)
        begin
          JSON.parse(resp_body)
        rescue Exception => e
          nil
        end
      end
  end
end
   
