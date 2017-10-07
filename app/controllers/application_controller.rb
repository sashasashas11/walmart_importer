class ApplicationController < ActionController::API

  protected

  def json_success(body={})
    json_response(body, :ok)
  end

  def json_error(body={}, code=:bad_request)
    json_response(body, code)
  end

  def json_response(body, status)
    render json: body, status: status
  end
end
