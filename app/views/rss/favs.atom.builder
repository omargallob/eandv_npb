atom_feed do |feed|
  feed.title("FAVS->Atom")
  #feed.updated(@stories.first.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
 
  @favs.each do |page|  
    feed.entry page, :url =>view_page_path(page.name) do |entry|
      entry.title(page.title)
      entry.content(image_tag(page.page_featured_photo.public_filename)+page.body,:type => 'html')
    end
  end
end