class AuthorHookListener < Redmine::Hook::ViewListener
  render_on :view_projects_form, partial: 'authors/author_form'
  render_on :view_author_of_project, partial: 'authors/author'
end
