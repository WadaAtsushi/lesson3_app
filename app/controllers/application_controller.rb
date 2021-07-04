class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_event_names

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def set_event_names
        @event_names = [
            "その他",
            "お食い初め",
            "ハーフバースデイ",
            "バースデイフォト",
            "桃の節句",
            "七五三（３歳）",
            "七五三（５歳）",
            "七五三（７歳】",
            "1/2成人式"
        ]

    end

    
end
