begin
  require File.join(File.dirname(__FILE__), 'lib', 'weibo_oauth') # From here
rescue LoadError
  begin
    require 'weibo_oauth' # From gem
  rescue LoadError => e
    # gems:install may be run to install Haml with the skeleton plugin
    # but not the gem itself installed.
    # Don't die if this is the case.
    raise e unless defined?(Rake) &&
      (Rake.application.top_level_tasks.include?('gems') ||
        Rake.application.top_level_tasks.include?('gems:install'))
  end
end
