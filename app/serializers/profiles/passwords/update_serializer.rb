class Profiles::Passwords::UpdateSerializer < ApplicationSerializer
  attributes :messages

  def messages
    I18n.t('app.update_success', subject: 'Password')
  end
end
