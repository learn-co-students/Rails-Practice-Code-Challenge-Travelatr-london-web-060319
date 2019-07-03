class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end
    def new
        @blogger = Blogger.new
    end
    def create
        blogger = Blogger.create(params_blogger(:name, :bio, :age))
        if blogger.valid?
            redirect_to blogger
        else
            flash[:errors] = blogger.errors.full_messages
            redirect_to new_blogger_path
        end
    end
    def show
        @blogger = Blogger.find(params[:id])
    end

    private
    def params_blogger(*args)
        params.require(:blogger).permit(*args)
    end
end