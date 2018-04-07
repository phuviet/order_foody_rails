class ApplicationController < ActionController::API
  include ApplicationHelper
  include APIErrorHandler
  serialization_scope nil
end
