module AuthorOfProjectHelper
  module PublicMethods
    def author_for_select
      User.all.select { |u| u.register }.map { |v| [v.name, v.id]}
    end
  end
end
