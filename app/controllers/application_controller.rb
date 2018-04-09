class ApplicationController < ActionController::API
  include ApplicationHelper
  include APIErrorHandler
  include Authorizable
  serialization_scope nil
end
