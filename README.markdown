# Devise spec

Spec User model files with Devise strategies specified.

## Install

<code>gem install devise-spec</code>

## Usage

Teaser:
<pre>
  root_dir.should have_model :user do |clazz|
    clazz.should have_default_devise_options
    clazz.should have_devise_options :database_authenticatable, :confirmable
  end  
</pre>

Full RSpec example:
<pre>
  root_dir = Rails3::Assist::Directory.rails_root

  describe 'Options are present in devise User model' do
    use_orm :none  

    it "should have the User model setup with the default devise strategies" do      
      create_model :user do
        %q{
          devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
        }
      end        

      root_dir.should have_model :user do |clazz|
        clazz.should have_default_devise_options
        clazz.should have_devise_options :database_authenticatable, :confirmable
      end
    end
  end  
</pre>

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Kristian Mandrup. See LICENSE for details.
