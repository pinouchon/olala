module Olala
  module ApplicationHelper
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