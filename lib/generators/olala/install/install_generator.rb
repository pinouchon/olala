require 'rails'
require 'rails/generators'

# run with: rails g olala:install

module Olala
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      desc "This generator installs olala + aloha"
      source_root File.expand_path('../../../../../vendor/assets/', __FILE__)

      def add_assets
        puts 'copying aloha into public/ ...'
        directory 'aloha', 'public/aloha/'
        puts 'Aloha jquery plugin is now installed in public/aloha'
      end

      def copy_olala
        say_status("copying", "olala", :green)
        copy_file "javascripts/olala.js", "app/assets/javascripts/olala.js"

        puts ''
        puts 'To use olala, you need to:'
        puts ' - add jquery in your javascript dependencies'
        puts ' - add "require olala" in app/assets/javascripts/application.js'
        puts ''
        puts 'More info at https://github.com/pinouchon/olala'
      end

    end
  end
end