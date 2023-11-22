class Dashboard::PostsController < Dashboard::DashboardApplicationController
    #before_action: authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @posts = Post.all
    end
    def show
        @post = Post.find_by(slug: params[:slug])
    end
    def new
        @post = current_user.posts.build
    end
    def create
        @post = current_user.posts.build(post_params)
        respond_to do |format|
            if @post.save
            #     format.html{
            #         redirect_to dashboard_posts_path, notice: "Post was created successfully"
            #     }
            @post.image.attach(params[:post][:image]) if params[:post][:image]
            else
                format.html{
                    render :new, status: :unprocessable_entity
                }
            end
        end
    end
    def edit
        @post = current_user.posts.find_by(slug: params[:slug])
    end
    def update
        @post = current_user.posts.find_by(slug: params[:slug])
        respond_to do |format|
            if @post.update(post_params)
                format.html{
                    redirect_to dashboard_posts_path, notice: "Post was updated successfully"
                }
            else
                format.html{
                    render :new, status: :unprocessable_entity
                }
            end
        end
    end
    def destroy
        @post = current_user.posts.find_by(slug: params[:slug])
        respond_to do |format|
            if @post.destroy
                format.html{
                    redirect_to dashboard_posts_path, notice: "Post was deleted"
                }
            else
                format.html{
                    redirect_to dashboard_posts_path, notice: "Post was not deleted"
                }
            end
        end

    end

    private
    def post_params
        p_params = params.require(:post).permit(:title, :excerpt, :body, :user_id, :published, :image)
        p_params[:slug] = p_params[:title].parameterize
        p_params
    end
end
