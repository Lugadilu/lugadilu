class Dashboard::ProjectsController < Dashboard::DashboardApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end

    def show
      
    end
    
    def new
        @project = Project.new
    end

    def edit

    end

    def create
        @project = Project.new(project_params)
        respond_to do |format|
            if @project.save
                format.html{
                    redirect_to dashboard_projects_path, notice: "Project was saved succesfully"
                }
            else
                format.html{
                    render :new, status: :unprocessable_entity
                }
            end
        end
    end

    def update
        respond_to do |format|
            if @project.update(project_params)
                format.html{
                    redirect_to dashboard_projects_path, notice: "Project was updated succesfully"
                }
            else
                format.html{
                    render :edit, status: :unprocessable_entity
                }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @project.destroy
                format.html{
                    redirect_to dashboard_projects_path, notice: "Project was deleted succesfully"
                }
            else
                format.html{
                    redirect_back_or_to dashboard_projects_path, notice: "Project could not be deleted"
                }
            end
        end
    end

    

    private
    def set_project
        @project = Project.find_by(slug: params[:slug])
    end
    
    def project_params
        p_params = params.require(:project).permit(:title, :excerpt, :description, :url, :image, :published)
        p_params[:slug] = p_params[:title].parameterize
        p_params
    end
end
