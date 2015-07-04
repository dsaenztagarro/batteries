# Devices present at home
class Device < ActiveRecord::Base
  validates :name, presence: true
  has_many :properties, :as => :attributable, :dependent => :destroy

  accepts_nested_attributes_for :properties, allow_destroy: true
end

