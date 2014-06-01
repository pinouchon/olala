require "olala/version"

module Olala
  # Your code goes here...
  module Controllers
    #autoload :Rememberable, 'devise/controllers/rememberable'
    autoload :Labels, 'olala/controllers'
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
