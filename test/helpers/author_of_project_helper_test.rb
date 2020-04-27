require 'test_helper'

class AuthorOfProjectHelperTest < ActionView::TestCase
  include AuthorOfProjectHelper::PublicMethods

  test '#author_for_select returns correct users list' do
    users = User.select { |u| u.register }.map { |v| [v.name, v.id]}
    assert_equal users, author_for_select
  end
end
