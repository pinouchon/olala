require "olala/version"

module Olala
  module Controllers
    #autoload :Rememberable, 'devise/controllers/rememberable'
    autoload :Labels, 'olala/controllers'
  end

  class Engine < Rails::Engine
    #config.autoload_paths << File.expand_path("../app", __FILE__)

    config.to_prepare do
      ApplicationController.helper(Olala::Helpers)
    end
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

  module Helpers
    def editable(label, default = 'undefined', &block)
      if block_given?
        raw "<div class='editable' data-label='#{label.to_s}'>" +
                Olala::Label.retrieve(label, capture(&block)) +
                '</div>'.html_safe
      else
        raw "<div class='editable' data-label='#{label.to_s}'>#{Olala::Label.retrieve(label, default)}</div>".html_safe
      end
    end
  end
end
