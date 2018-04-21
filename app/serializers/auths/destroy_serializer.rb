class Auths::DestroySerializer < ApplicationSerializer
  attributes :message

  def message
    I18n.t 'authorized.logout_success'
  end
end
