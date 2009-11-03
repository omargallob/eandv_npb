xml.instruct!
xml.favourites do
  @favs.each do |page|
    xml.page do
      xml.title page.title
      xml.body page.body.gsub(/<\/?[^>]*>/, "")
    end
  end
end