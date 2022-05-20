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
      'DS_API_KEY',
      'DS_INDEX_NAME',
    ]
    required_data.all? { |key| ENV[key].presence }
  end

  def cdn_image(name, options = {})
    src = "https://assets.titleleaf.com/guide/#{name}"
    image_tag src, options
  end

  def titleleaf_perform_icon
    fa_icon "far fa-arrow-to-right inline-icon"
  end

  def titleleaf_download_icon
    fa_icon "far fa-arrow-from-top inline-icon"
  end

  def check_icon
    fa_icon "fas fa-check"
  end

  def fa_icon(klass = "")
    "<i class=\"#{klass}\"></i>"
  end

  def templates_link(name, options = {})
    url = "https://drive.google.com/drive/folders/0B5nSLzCVc941WEZFcmkteUhueFk?resourcekey=0-uVCkAZEunfLxPTEzCG3wGg&usp=sharing"
    external_link name, url, options
  end

  def other_link(name, options = {})
    url = "https://drive.google.com/drive/folders/0B5nSLzCVc941cmJiUUp2UUdZeGc?resourcekey=0-0jLOnSX_H2AlC5shQD2k0Q&usp=sharing"
    external_link name, url, options
  end

  def external_link(name, url, options)
    default_options = { target: "_blank" }
    options.reverse_merge!(default_options)
    link_to name, url, options
  end

  def guide_link(options = {})
    name = options.delete(:name) || "TitleLeaf Guide"
    url = data.config.guide_url
    link_to name, url, options
  end

  def wiki_link(options = {})
    name = options.delete(:name) || "TitleLeaf Support Articles"
    url = data.config.wiki_url
    link_to name, url, options
  end

  def support_link(options = {})
    name = options.delete(:name) || "TitleLeaf Client Support Site"
    url = data.config.support_url
    link_to name, url, options
  end

  def service_link(options = {})
    name = options.delete(:name) || "TitleLeaf Service Level Agreements"
    url = data.config.service_path
    link_to name, url, options
  end

  def signup_link(options = {})
    name = options.delete(:name) || "Sign Up"
    url = data.config.signup_path
    link_to name, url, options
  end

  def setup_link(options = {})
    name = options.delete(:name) || "setup"
    url = data.config.signup_path
    link_to name, url, options
  end

  def buy_link(options = {})
    name = options.delete(:name) || "Buy Now"
    url = data.config.buy_path
    link_to name, url, options
  end

  def contact_link(options = {})
    name = options.delete(:name) || "Contact"
    url = data.config.contact_path
    link_to name, url, options
  end

  def status_link(options = {})
    name = options.delete(:name) || "TitleLeaf Status Page"
    url = data.config.status_url
    link_to name, url, options
  end
end
