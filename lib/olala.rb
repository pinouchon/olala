require "olala/version"

module Olala
  module Controllers
    #autoload :Rememberable, 'devise/controllers/rememberable'
    autoload :Labels, 'olala/controllers'
  end

  class Engine < Rails::Engine
    config.autoload_paths << File.expand_path("../app", __FILE__)
  end

  module CustomAuth
    def self.included(base)
      base.send(:before_filter, :custom_auth)
    end

    def custom_auth
      if params[:admin] == 'secretpass42'
        session[:admin] = true
      end
      if params[:admin] == ''
        session[:admin] = false
      end
    end

  end
end
