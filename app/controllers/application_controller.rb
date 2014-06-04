class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method def current_user
    return @_current_user if defined?( @_current_user )

    user =
      if ( session_user_id = session[ :user_id ] ).present?
        begin
          User.find session_user_id
        rescue
          false
        end
      else
        false
      end

    @_current_user ||= user
  end

  helper_method def current_user?
    current_user.present?
  end

  protected def current_user=( user )
    user_id = user.try :id

    if user_id.present?
      session[ :user_id ] = user_id
      @_current_user = user
    end

    current_user
  end
end
