module UserHelper

    def logged_in?
        if !current_user 
            redirect_to new_user_session_path, notice: "You must log in first"
        end
    end
end
