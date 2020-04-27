require 'test_helper'

class ProjectsIntegrationTest < ActionDispatch::IntegrationTest
  fixtures :projects, :users
  include AuthorOfProjectHelper::PublicMethods

  setup do
    post "/login", params: {
        username: users(:users_001).login,
        password: 'admin'
    }
    @project = projects(:projects_001)
  end

  test 'form has new field' do
    get settings_project_path(@project)
    assert_response :success

    assert_select "body.project-#{@project.identifier} #wrapper #main #content form#edit_project_#{@project.id}" do
      assert_select 'p' do
        assert_select 'label', for: 'project_author_id', text: 'Author'
        assert_select 'select#project_author_id' do
          author_for_select.each do |option|
            assert_select 'option', value: option.second, text: option.first
          end
        end
      end
    end
  end
end
