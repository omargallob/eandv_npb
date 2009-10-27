class Category < ActiveRecord::Base
  
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Category', :foreign_key => 'parent_id'
  
  def self.find_main
    Category.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
  end
  
  def self.find_sub(pid)
    Category.find(:all, :conditions => ['parent_id = ?', pid])
  end
end
