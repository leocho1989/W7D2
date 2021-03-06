class Userscontroller < ApplicationController
    def show
        render :show
    end
        
    def create
       @user = User.new(user_params)
       if @user.save
        @user.activate!
        login_user!(@user)
         redirect_to root_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:email, :password)
    end
end