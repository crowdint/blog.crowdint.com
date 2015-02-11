class ErrorsController < ApplicationController
  def file_not_found
    @error_code = 404
    render template: 'errors/error', status: 404
  end

  def internal_server_error
    @error_code = 500
    render template: 'errors/error', status: 404
  end
end
