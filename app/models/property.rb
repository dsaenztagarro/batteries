# Allows to add properties to models through polymorphic association "attributable"
class Property < ActiveRecord::Base
  belongs_to :attributable, polymorphic: true
  belongs_to :property_type
	delegate :name, to: :property_type, prefix: true
	default_scope { joins(:property_type).includes(:property_type).order('property_types.name ASC') }
end
