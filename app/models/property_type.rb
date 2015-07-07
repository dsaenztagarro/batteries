# Defines the allowed types of properties
class PropertyType < ActiveRecord::Base
  validates :name, presence: true
  has_many :properties
	default_scope { order(:name) }
end
