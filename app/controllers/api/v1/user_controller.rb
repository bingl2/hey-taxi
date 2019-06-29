class Api::V1::UserController < ApiController
  swagger_controller :users, "User Management"

  swagger_api :index do
    summary "Fetches all User items"
    notes "This lists all the active users"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Team Id"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
    response :requested_range_not_satisfiable
  end
end