class SubscribersController < ApplicationController

    before_action :authorize, :except => [:create]
    before_action :admin_authorize, :only => [:index, :destroy]

    def index
        @subscribers = Subscriber.all
    end

    def create
        @subscriber = Subscriber.new(subscriber_params)
        if Subscriber.exists?(email: @subscriber.email)
            redirect_to root_path, alert: "Sorry, that email already exists!"
        elsif @subscriber.save 
            redirect_to root_path, notice: "Thank you #{@subscriber.f_name}, for subscribing to my Newsletter."
        else 
            redirect_to root_path alert: "Sorry, I failed to save your information. Please try again."
        end
    end
    
    private def subscriber_params
        params.require(:subscriber).permit(:f_name, :l_name, :email, :country)
    end
end