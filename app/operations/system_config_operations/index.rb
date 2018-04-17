class SystemConfigOperations::Index < ApplicationOperation
  def call
    SystemConfig.all
  end
end
