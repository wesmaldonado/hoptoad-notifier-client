class HoptoadNotifierClient

  require 'rubygems'
  require 'httparty'  
  include HTTParty

  base_uri "http://hoptoadapp.com"
  format :xml
  @instances = {}

  class << self
    attr_accessor :instances
    def configure
      yield self
    end
  end

  def self.register(name, key)
    @instances[name] = HoptoadNotifierClient.new(key)
  end

  def self.create(name)
    @instances[name]
  end

  # proxy existing class level calls to original api key
  def self.notify(error, request = {}, session = {})
    raise "No :default project registered, register one to use this call." unless @instances.has_key?(:default)
    @instances[:default].notify(error, request, session)
  end
  
  def initialize(key)
    raise "API Key required." unless key
    @api_key = key
  end

  def notify(error, request = {}, session = {})
    
    error_type = error.respond_to?(:error_type) ? error.error_type : error.class.name
    error_message = error.respond_to?(:custom_message) ? error.custom_message : "#{error.class.name}: #{error.message}"
    
    data = {'notice' => {
            'api_key' => @api_key,
            'request' => request,
            'error_class' => error_type,
            'error_message' => error_message,
            'backtrace' => error.backtrace ||= [],
            'environment' => ENV.to_hash,
            'session' => session
          }}
    begin
      response = self.class.post "/notices/", 
                      :body => data.to_yaml,
                      :headers => { 
                                    "Content-type" => "application/x-yaml", 
                                    "Accept" => "text/xml, application/xml"
                                  }
      
    rescue Exception => e
      puts "Something went wrong, is your API key correct? Exception was #{e}"
      # logger.error "HoptoadNotificationClient FAILED during notification: Exception was [#{e.to_s}]" if logger
    end
  end
end