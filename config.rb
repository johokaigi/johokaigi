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

helpers do
  def page_title
    current_page.data.title ? "#{current_page.data.title} | JohoKaigi - 情報会議" : 'JohoKaigi - 情報会議'
  end

  def page_description
    base_description = 'チームでの情報共有ツールの活用について、悩みや知見を共有したり、方法論を整理するイベントをやっています。'
    current_page.data.description || base_description
  end

  def page_url
    "http://johokaigi.org#{current_page.url}"
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
  deploy.build_before = true
end
