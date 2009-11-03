atom_feed do |feed|
  feed.title("FAVS->Atom")
  #feed.updated(@stories.first.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
 
  @properties.each do |property|  
    feed.entry property do |entry|
      entry.title(property.id)
      entry.content(property.description)
    end
  end
end