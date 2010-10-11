# Be sure to restart your server when you modify this file

# def test_web_browser
#   catch(:match) do
#     ["Apple", "Firefox/3", "Firefox/2", "MSIE 6", "MSIE 7", "Opera"].each do |ua|
#       throw(:match, ua.gsub(/[^a-z0-9]/i, "")) if request.user_agent =~ Regexp.new(ua)
#     end
#     nil
#   end
# end


# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# Nedenstående er nødvendigt for at for has_finder til at virke

Rails::Initializer.run do |config|
  
  # Bruges vedr. DateTime Toolbocks
  # config.plugins = ["engines", "*"]
  
  
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use (only works if using vendor/rails).
  # To use Rails without a database, you must remove the Active Record framework
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_kruby_session',
    :secret      => '91f0b56bd7ce225451d290b92e3df757bed98bad7f1c22fec3e91056108b6db73be4725563b754e3d06c8c42fb80b297d3d5672d5aca43728442fd255c7028c5'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
  
  #config.gem "searchlogic"
  config.gem "RedCloth"
  config.gem "will_paginate"
  
  ### Hvis du kører script/server skal du istedet skrive gem "RedCloth" f.eks for at det virker

end

# gem 'mislav-will_paginate', '~> 2.2'
#   require 'will_paginate'
# gem 'has_finder'
#   require 'has_finder'
#   
  # gem 'RedCloth'
  #      require 'RedCloth'
  
  WillPaginate::ViewHelpers.pagination_options[:prev_label] = '<<'
  WillPaginate::ViewHelpers.pagination_options[:next_label] = '>>'

  # silence_warnings do
  #          require "#{File.expand_path(RAILS_ROOT)}/vendor/RedCloth-3.0.3/lib/redcloth.rb"
  #      end


  #Paperclip.options[:command_path] = '/Users/thomas/ImageMagick-6.5.5/bin'
  #Paperclip.options[:image_magick_path] = '/Users/thomas/ImageMagick-6.5.5/bin'
  
  # if RAILS_ENV == "development"
  #  Paperclip.options[:command_path] = '/Users/thomas/ImageMagick-6.5.5/bin'
  #  Paperclip.options[:magick_home] = '/Users/thomas/ImageMagick-6.5.5'
  # 
  #   if Paperclip.options[:magick_home]
  #     ENV['MAGICK_HOME'] = Paperclip.options[:magick_home]
  #     ENV['DYLD_LIBRARY_PATH'] = Paperclip.options[:magick_home] + "/lib"
  #   end
  # end
  




