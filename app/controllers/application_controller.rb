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

end
