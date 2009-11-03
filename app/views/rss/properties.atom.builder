atom_feed do |feed|
  feed.title("properties->Atom")
  #feed.updated(@stories.first.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
 
  @properties.each do |property|  
    feed.entry property do |entry|
      entry.title(property.title)
      entry.content(property.description.gsub(/<\/?[^>]*>/, ""))
    end
  end
end