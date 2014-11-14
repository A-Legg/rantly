module ApplicationHelper

  def markdown(rant)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    .render(rant).html_safe

  end

  
end
