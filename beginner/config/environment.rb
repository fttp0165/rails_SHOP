# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.generators do |g|
    g.javascript_engin :js
  end  
end

