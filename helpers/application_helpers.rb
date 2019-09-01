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

  def body_class(*args)
    parts = [current_page_name] + args
    parts.compact.uniq.join(' ')
  end

  def current_page_name
    current_page.path.sub(/\.html$/, '').gsub(/\//, '-')
  end

  def docsearch_enabled
    required_data = [
      'DS_APPLICATION_ID',
      'DS_API_KEY',
      'DS_INDEX_NAME',
    ]
    required_data.all? { |key| ENV[key].presence }
  end
end
