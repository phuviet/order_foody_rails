class Comments::ParentSerializer < Comments::MetaSerializer
  has_many :child_comments, serializer: Comments::MetaSerializer
end
