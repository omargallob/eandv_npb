xml.instruct!

xml.html {                      # <html>
   xml.head {                    #   <head>
     xml.title("Favourites")        #     <title>History</title>
   }                            #   </head>
   xml.body {                    #   <body>
     xml.favourites do
       @favs.each do |page|
         xml.page do
           xml.image(
                :id          =>  page.page_featured_photo.id,
                :title       =>  "testing",
                :description =>  "image.description",
                :filename    =>  page.page_featured_photo.filename,
                :url         =>  page.page_featured_photo.public_filename     
              )
           xml.title page.title
           xml.body page.body.gsub(/<\/?[^>]*>/, "")
         end
       end
     end
   }                          
 }
