module ApplicationHelper
  include Rails.application.routes.url_helpers
  
  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "card border border-red-400 mb-8") do
        concat(content_tag(:div, class: " bg-red-500 text-white card-header") do
           concat "The form has #{pluralize(object.errors.count, "error")}. Please rectify them:"
        end)
        concat(content_tag(:div, class: "card-body") do
          concat(content_tag(:ul, class: 'mb-0') do
            object.errors.full_messages.each do |msg|
               concat content_tag(:li, msg)
            end
          end)
        end)
      end
    end
  end
end
