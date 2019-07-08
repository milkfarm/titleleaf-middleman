module ApplicationHelpers
  def markdown(contents)
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(
      renderer,
      autolink: true,
      fenced_code_blocks: true,
      footnotes: true,
      highlight: true,
      smartypants: true,
      strikethrough: true,
      tables: true,
      with_toc_data: true
    )
    markdown.render(contents)
  end

  def page_title(part, options = {})
    options = { join_with: ' | ' }.merge(options)
    parts = [data.config.company_name]
    parts << part
    parts.compact.reverse.join(options[:join_with])
  end
end
