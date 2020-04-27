require File.expand_path('../../test_helper', __FILE__)

class ProjectControllerTest < ActionDispatch::IntegrationTest
  fixtures :projects, :users

  setup do
    post "/login", params: {
        username: users(:users_001).login,
        password: 'admin'
    }
    @project = projects(:projects_001)
    @controller = ProjectsController.new
  end

  test 'can update project with author' do
    patch project_url(@project), params: { project: { author_id: users(:users_001).id } }
    assert_redirected_to settings_project_path(@project)
    @project.reload
    assert_equal users(:users_001).name, @project.author.name
  end
end
