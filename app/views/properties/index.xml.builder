xml.instruct!
xml.properties do
  @properties.each do |property|
    xml.property do
      xml.title property.title
      xml.body property.description.gsub(/<\/?[^>]*>/, "")
      xml.price property.price
      xml.bedrooms property.bedrooms
      xml.bathrooms property.bathrooms
      xml.facilities do
         property.facilities.each do |facility|
          xml.facility do
            xml.title facility.title
          end
        end
      end
    end
  end
end