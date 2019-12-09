module ApplicationHelper
    def navbar
        if logged_in?
            render "layouts/logged_in_nav"
        else
            render "layouts/logged_out_nav"
        end
    end 
end
