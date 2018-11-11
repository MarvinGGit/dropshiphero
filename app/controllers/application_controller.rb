class ApplicationController < ActionController::Base

    before_action :is_user_still_subscribed

    private
        def is_user_still_subscribed
            if user_signed_in?
                if current_user.subscribed?
                    if current_user.subscribed_until?
                        if (Time.at(current_user.subscribed_until).to_i - Time.now.to_i) < 0
                            current_user.subscribed = false
                            current_user.save!
                        end
                    end
                end
            end
        end

end
