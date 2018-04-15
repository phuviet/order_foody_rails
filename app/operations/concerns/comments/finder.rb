module Comments::Finder
  extend ActiveSupport::Concern

  def load_comment!(id)
    Comment.find(id)
  end
end
