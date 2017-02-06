#require "memoryleak"
# require 'pp'
module PublicNewDefaults
#  pp "initializing resources"
# FIXME do we need to do this in the intializer?
#  Repository.set_repos(ArchivesSpaceClient.new.list_repositories)

# determining the main menu
  $MAIN_MENU = []
  AppConfig[:pui_hide].keys.each do |k|
    unless AppConfig[:pui_hide][k]
      case k
        when :repositories
          $MAIN_MENU.push(['/repositories', 'repository._plural'])
        when :resources
          $MAIN_MENU.push(['/repositories/resources', 'resource._plural'])
        when :digital_objects
          $MAIN_MENU.push(['/objects?limit=digital_object', 'digital_object._plural' ])
        when :accessions
          $MAIN_MENU.push(['/accessions', 'unprocessed'])
        when :subjects
          $MAIN_MENU.push(['/subjects', 'subject._plural'])
        when :agents
          $MAIN_MENU.push(['/agents', 'pui_agent._plural'])
        when :classifications
          $MAIN_MENU.push(['/classifications', 'classification._plural'])
      end
    end
  end

  def self.add_menu_item(path, label, position = nil)
    if position.nil?
      $MAIN_MENU.push([path, label])
    else
      $MAIN_MENU.insert(position, [path, label])
    end
  end
#  Pry::ColorPrinter.pp $MAIN_MENU
#  MemoryLeak::Resources.define(:repository, proc { ArchivesSpaceClient.new.list_repositories }, 60)
#pp MemoryLeak::Resources.get(:repository)

end