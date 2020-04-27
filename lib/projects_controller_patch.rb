module ProjectsControllerPatch
  def create
    super
    @project.author = params[:project][:author]
  end
end
