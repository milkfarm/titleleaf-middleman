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
    src = "https://static.titleleaf.com/guide/#{name}"
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
    external_link name, data.config.templates_url, options
  end

  def other_link(name, options = {})
    external_link name, data.config.other_url, options
  end

  def external_link(name, url, options)
    default_options = { target: "_blank" }
    options.reverse_merge!(default_options)
    link_to name, url, options
  end

  def guide_link(options = {})
    name = options.delete(:name) || "TitleLeaf Guide"
    url = data.config.guide_path
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

  def service_mail(options = {})
    name = options.delete(:name) || "Request Now"
    email = data.config.sales_mail
    options = {
      subject: "TitleLeaf: Service Plan Request",
      body: "Please send me a payment link to subscribe to TitleLeaf's service plan"
    }.merge(options)
    mail_to email, name, options
  end

  def pricing_link(options = {})
    name = options.delete(:name) || "monthly subscription"
    url = data.config.pricing_path
    link_to name, url, options
  end

  def setup_link(options = {})
    name = options.delete(:name) || "one-time setup"
    url = data.config.setup_path
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

  def meeting_link(options = {})
    name = options.delete(:name) || "meet.goto.com/titleleaf"
    url = data.config.meeting_url
    link_to name, url, options
  end

  def schedule_link(options = {})
    name = options.delete(:name) || "scheduling a meeting"
    url = data.config.schedule_url
    link_to name, '', options.merge(onclick: "Calendly.initPopupWidget({url: '#{url}'});return false;")
  end

  def titleize(word)
    word.gsub(/\b(?<!\w['â`])[a-z]/) do |match|
      match.capitalize
    end
  end
end
