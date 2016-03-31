module ApplicationHelper

  def bootstrap_class_for(flash_type)

    case flash_type
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-warning'
      when 'notice'
        'alert-info'
      else
        flash_type.to_s
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(RedcarpetHelper::HTMLBlockCode,
                                       no_intra_emphasis: true,
                                       fenced_code_blocks: true,
                                       disable_indented_code_blocks: true)
    return markdown.render(text).html_safe
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  
end