class Admin::BaseController < ApplicationController		
 before_filter :login_required
 require_role ["admin",'eandv']
 layout 'admin' 
 include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
 include RoleRequirementSystem
  
  
 def setmeta
   set_meta_tags :site => 'Admin - E&V NPB - '+ controller_name.capitalize + ' - ' + action_name
 end
end