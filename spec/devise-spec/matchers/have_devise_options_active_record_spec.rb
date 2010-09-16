require 'spec_helper'

root_dir = Rails3::Assist::Directory.rails_root

describe 'RSpec matcher to spec that auth options are present in devise User model' do
  use_orm :active_record  
  use_helpers :model

  before :each do
    create_model :user do
      %q{
        devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
      }
    end        
    puts read_model :user
  end

  after :each do              
    remove_model :user
  end

  it "should have the User model setup with the default devise strategies" do
    root_dir.should have_model :user do |clazz|
      clazz.should have_default_devise_options
      clazz.should have_devise_options :database_authenticatable, :confirmable
    end      
  end
end

