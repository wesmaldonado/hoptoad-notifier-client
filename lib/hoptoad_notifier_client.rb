class HoptoadNotifierClient
  require 'rubygems'
  require 'httparty'  
  include HTTParty
  
  base_uri "http://hoptoadapp.com"
  format :xml

  class << self
    attr_accessor :api_key
    def configure
      yield self
    end
  end
  
  def self.notify(error, request = {}, session = {})
    data = {'notice' => {
            'api_key' => HoptoadNotifierClient.api_key,
            'request' => request,
            'error_class' => error.class.name,
            'error_message' => "#{error.class.name}: #{error.message}",
            'backtrace' => error.backtrace,
            'environment' => ENV.to_hash,
            'session' => session
          }}
    begin
      response = post "/notices/", 
                      :body => data.to_yaml,
                      :headers => { 
                                    "Content-type" => "application/x-yaml", 
                                    "Accept" => "text/xml, application/xml"
                                  }
      puts "Hoptoad notified of exception [#{error.to_s}]"
    rescue Exception => e
      puts "Noptoad FAILED during notification: Exception was [#{e.to_s}]"
    end
  end
end
