module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = 
    content_tag(:div, :class => 'alert alert-error alert-block') do
        concat content_tag(:button,x,:class => 'close', :"data-dismiss" => 'alert')
        concat content_tag(:p, messages)
    end
    
  end
end

