class PostsController < ApplicationController
    
   

    def new 
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id # assign the post to the user who created it.
        respond_to do |f|
            if (@post.save) 
                f.html { redirect_to "", notice: "Question created!" }
            else
                f.html { redirect_to "", notice: "Error: Your Question has already been asked!." }
            end
        end
    end
    
    
    private
    def post_params # allows certain data to be passed via form.
        params.require(:post).permit(:user_id, :content)      
    end
    
end