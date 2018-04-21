class ProfileOperations::Index < ApplicationOperation
  include Users::Finder

  def call
    load_user!(actor.id)
  end
end
