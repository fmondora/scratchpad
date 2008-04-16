require 'routing_navigator'
require 'dispatcher'
Dispatcher.to_prepare :routing_navigator_route do
  ActionController::Routing::Routes.add_route '/routing_navigator/:action/:id', :controller => 'routing_navigator', :action => 'index', :id => nil
end if RAILS_ENV == 'development'