xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.each do |resource|
    xml.url do
      xml.loc "http://htomine.github.io/pmconf#{resource.url}"
    end if resource.destination_path =~ /\.html$/
  end
end
