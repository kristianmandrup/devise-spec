require 'rspec/core'
require 'devise-spec'
require 'rails-app-spec'

RSpec.configure do |config| 
  config.mock_with :mocha
  config.before do                                         
    Rails3::Assist::Directory.rails_root = temp_dir('tmp_rails')
  end

  config.after do
    remove_temp_dir 'tmp_rails'
  end   
end

def project_dir
  File.dirname(__FILE__) + '/..'
end

def temp_dir name
  File.join(project_dir, name)  
end

def make_temp_dir name   
  FileUtils.mkdir_p temp_dir(name)
  temp_dir(name)
end

def remove_temp_dir name   
  FileUtils.rm_rf temp_dir(name)
end
