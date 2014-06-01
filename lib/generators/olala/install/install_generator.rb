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
        puts 'done copying aloha into public'
      end

    end
  end
end