require 'rails'
require 'rails/generators'

# run with: rails g olala:install

module Olala
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      include Rails::Generators::Migration

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        migration_template "../../lib/generators/olala/install/templates/create_labels.rb", "db/migrate/create_labels.rb"
        #migration_template "create_something_else.rb", "db/migrate/create_something_else.rb"
      end

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