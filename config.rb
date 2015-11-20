Time.zone = 'Tokyo'

activate :directory_indexes

activate :blog do |blog|
  blog.layout = 'article_layout'
  blog.permalink = '/{year}/{month}/{day}/{title}.html'
  blog.prefix = 'articles'
  blog.sources = '/items/{year}-{month}-{day}-{title}.html'
  blog.new_article_template = 'article_template.erb'
  blog.default_extension = '.md'

  blog.custom_collections = {
    category: {
      link: '/categories/{category}.html',
      template: '/articles/category.html'
    }
  }
end

page '/', layout: 'no_header_layout'
page 'sitemap.xml', layout: 'xml_layout'

helpers do
  def page_title
    if current_page.data.title
      "#{current_page.data.title} | JohoKaigi - 情報会議"
    elsif yield_content(:title)
      "#{yield_content(:title)} | JohoKaigi - 情報会議"
    else
      'JohoKaigi - 情報会議'
    end
  end

  def page_description
    if current_page.data.description
      current_page.data.description
    elsif yield_content(:description)
      yield_content(:description)
    else
      'JohoKaigi - 情報会議は、チームでの情報共有について、Tipsや悩みの共有や集約を通して、情報の共有方法や情報共有をする文化作りをする方法を整理するためのコミュニティです。'
    end
  end

  def page_url
    "http://johokaigi.org#{current_page.url}"
  end

  def members
    arr = []
    data.humans.organizers.each { |o| arr << o }
    data.humans.supporters.each { |s| arr << s }
    arr
  end
end

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'gh-pages'
  deploy.remote = "https://#{ENV['GH_TOKEN']}@github.com/johokaigi/johokaigi.git"
  deploy.build_before = true
end
