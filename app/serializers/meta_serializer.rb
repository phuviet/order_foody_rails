class MetaSerializer < ApplicationSerializer
  attribute(:total_entries) { object.total_entries }
end
