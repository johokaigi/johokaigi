Time.zone = 'Tokyo'

activate :directory_indexes

activate :blog do |blog|
  blog.name = 'articles'
  blog.prefix = 'articles'

  blog.layout = 'article_layout'
  blog.permalink = '/{year}/{month}/{day}/{title}.html'
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

activate :blog do |blog|
  blog.name = 'tips'
  blog.prefix = 'tips'

  blog.layout = 'tips_layout'
  blog.permalink = '/{title}.html'
  blog.sources = '/items/{title}.html'
  blog.new_article_template = 'tips_template.erb'
  blog.default_extension = '.md'
end

# page '/', layout: 'no_header_layout'
page 'sitemap.xml', layout: 'xml_layout'

helpers do
  def page_title
    if current_page.data.title
      "#{current_page.data.title} | Japan Product Manager Conference 2016"
    elsif yield_content(:title)
      "#{yield_content(:title)} | Japan Product Manager Conference 2016"
    else
      'Japan Product Manager Conference 2016 | 2016/10/24~10/25'
    end
  end

  def page_description
    if current_page.data.description
      current_page.data.description
    elsif yield_content(:description)
      yield_content(:description)
    else
      'Japan Product Manager Conference 2016 - プロダクトマネージャーが日本を救う'
    end
  end

  def page_url
    "http://htomine.github.io/pmconf/#{current_page.url}"
  end

  def members
    arr = []
    data.staff.organizers.each { |o| arr << o }
    data.staff.collaborators.each { |s| arr << s }
    arr
  end

  def sponsors
    arr = []
    data.sponsors.platinas.each { |sp| arr << sp }
    data.sponsors.golds.each { |sg| arr << sg }
    data.sponsors.sivers.each { |ss| arr << ss }
    data.sponsors.drinks.each { |sd| arr << sd }
    arr
  end

  # def staff_readme
  #   readme = Octokit.readme 'htomine/pmconf_staff',
  #            accept: 'application/vnd.github.html'
  #   readme.force_encoding('UTF-8')
  # end
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
  deploy.remote = "https://#{ENV['GH_TOKEN']}@github.com/htomine/pmconf.git"
  deploy.build_before = true
end
