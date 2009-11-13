# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :setmeta, :get_pages_for_tabs, :set_user_locale
  
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  
  def setmeta
    set_meta_tags :site => 'E&V NPB'
  end 
  
  def get_pages_for_tabs
    @tabs = Page.find_main
  end
  
  def set_user_locale
    I18n.locale = current_user.language if logged_in?
  end
  
  
  
  #def default_url_options(options={}) 
  #   logger.debug "default_url_options is passed options: #{options.inspect}\n"
  #   { :locale => I18n.locale }
  #end 
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

end
