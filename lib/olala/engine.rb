module Olala
  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../../app", __FILE__)
  end
end