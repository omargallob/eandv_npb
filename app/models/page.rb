class Page < ActiveRecord::Base
  
  has_one :metatag
  has_one :page_featured_photo,:foreign_key => 'page_id'
  
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'
  
  def self.find_main
    Page.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
  end
  
 # auto_html_for :body do
 #     html_escape
 #     image
 #    youtube :width => 400, :height => 250
 #     link :target => "_blank", :rel => "nofollow"
 #   simple_format
 #  end
end
