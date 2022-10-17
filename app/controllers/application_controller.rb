class ApplicationController < ActionController::Base

  def render_error_messages(obj)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(
        'error_explanation', 
        partial: 'layouts/errors', 
        locals: { obj: obj }
      ) }
    end
  end

  def render_not_found
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

end
