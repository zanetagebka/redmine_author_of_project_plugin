require_dependency 'author_hook_listener'
require 'author_of_project_helper'
require 'projects_controller_patch'
require 'project_patch'

ActionView::Base.send :include, AuthorOfProjectHelper::PublicMethods
Rails.configuration.to_prepare do
  ProjectsController.prepend(ProjectsControllerPatch)
  Project.safe_attributes 'author_id'
end

unless Project.included_modules.include? ProjectPatch
  Project.send(:include, ProjectPatch)
end

Redmine::Plugin.register :author do
  name 'Author plugin'
  author 'Zaneta Gebka'
  description 'This is a plugin for Redmine to allow add author of project'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'https://github.com/zanetagebka'
end
