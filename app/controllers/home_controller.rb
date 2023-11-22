class HomeController < ApplicationController
    def index
        @projects = Project.all
        @posts = Post.all
    end

    def hydrology
    end
end
