class Products::ShowSerializer < Products::AttributesSerializer
  attributes :description

  has_one :category, serializer: Categories::MetaSerializer

  has_many :votes, serializer: Votes::MetaSerializer
  has_many :parent_comments, serializer: Comments::ParentSerializer
  has_many :products_images, serializer: AvatarSerializer
end
