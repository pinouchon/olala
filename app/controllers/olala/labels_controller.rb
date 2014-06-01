module Olala
  class LabelsController < ApplicationController
    include ApplicationHelper

    before_filter :check_admin_right
    protect_from_forgery :except => :create

    def check_admin_right
      if !session[:admin]
        raise 'Access denied'
      end
    end

    def create
      params.permit(:label, :content)

      label = Label.find_or_create_by_label params[:label]
      label.content = params[:content] if params[:content]
      label.save
      render text: 'ok'
    end
  end
end