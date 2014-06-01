module Olala
  class LabelsController < ApplicationController
    include ApplicationHelper

    before_filter :check_admin_right

    def check_admin_right
      if !session[:admin]
        raise 'Access denied'
      end
    end

    def index
      render text: 'hello index'
    end

    def create
      abort('labels create')
      params.permit(:label, :content_fr, :content_en)

      label = Label.find_or_create_by_label params[:label]
      label.content_fr = params[:content_fr] if params[:content_fr]
      label.content_en = params[:content_en] if params[:content_en]
      label.save
      render text: 'ok'
    end
  end
end