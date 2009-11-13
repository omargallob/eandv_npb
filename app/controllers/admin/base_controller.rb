class Admin::BaseController < ApplicationController		
 before_filter :login_required
 require_role ["admin",'eandv']
 layout 'admin' 
 
 def setmeta
   set_meta_tags :site => 'Admin - E&V NPB - '+ controller_name.capitalize + ' - ' + action_name
 end
end