require 'code-spec'

module RSpec::RubyContentMatchers
  module Devise
    def have_default_devise_options
      have_call "devise", :args => [:database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable]
    end

    def have_devise_options *names
      have_call "devise", :args => names
    end                                                                                            
  end
end
