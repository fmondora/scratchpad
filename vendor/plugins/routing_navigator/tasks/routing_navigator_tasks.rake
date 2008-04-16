desc "Copies the latest routing navigator assets to the application's public directory"
task :update_routing_navigator do
  FileUtils.cp File.join(File.dirname(__FILE__), '../public/javascripts/routing_navigator.js'),  File.join(RAILS_ROOT, 'public', 'javascripts')
  FileUtils.cp File.join(File.dirname(__FILE__), '../public/stylesheets/routing_navigator.css'), File.join(RAILS_ROOT, 'public', 'stylesheets')
end

desc "List all routes for this app.  (optional: pass CONTROLLER or ACTION to filter: rake routes CONTROLLER=posts)"
task :routes => :environment do
  filter = routing_filter
  puts filter.empty? ? "Showing all Routes" : "Showing all Routes matching #{filter.inspect}"
  ActionController::Routing::Routes.filtered_routes(filter).each do |route|
    puts "- #{route.segments.collect(&:to_s)}"
  end
end

desc "List all named routes for this app.  (optional: pass CONTROLLER or ACTION to filter: rake routes CONTROLLER=posts)"
task :named_routes => :environment do
  filter = routing_filter
  puts filter.empty? ? "Showing all Named Routes" : "Showing all Named Routes matching #{filter.inspect}"
  names, routes = [], []
  ActionController::Routing::Routes.filtered_named_routes(filter).each do |name, route|
    names << name; routes << route
  end
  
  longest = names.sort_by  { |s| s.to_s.length }.reverse.first
  names.collect! { |n| "#{n}_url".ljust(longest.to_s.length + 4) }
  
  names.each_with_index do |name, i|
    puts "- #{name}: #{routes[i].segments.collect(&:to_s)}"
  end
end

def routing_filter
  returning({}) do |options|
    options[:controller] = ENV['CONTROLLER'] if ENV['CONTROLLER']
    options[:action]     = ENV['ACTION']     if ENV['ACTION']
  end
end