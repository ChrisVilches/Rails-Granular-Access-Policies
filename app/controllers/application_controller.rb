class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :policy_fail

  protected
  def policy_fail(exception)
    respond_to do |format|
      format.json {
        render :json => { :error => "No esta autorizado para esta operación." }, :status => :bad_request
      }
      format.html {
        flash[:error] = "No esta autorizado para esta operación."
        redirect_to root_path
      }
    end
  end
end
