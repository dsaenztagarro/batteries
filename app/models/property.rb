# Allows to add properties to models through polymorphic association "attributable"
class Property < ActiveRecord::Base
  belongs_to :attributable, polymorphic: true
  belongs_to :property_type
end
