# Devices present at home
class Device < ActiveRecord::Base
  belongs_to :category, class_name: 'DeviceCategory'

  validates :name, presence: true, uniqueness: true
  validates :device_category_id, presence: true

  has_many :properties, as: :attributable, dependent: :destroy

  accepts_nested_attributes_for :properties, allow_destroy: true

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
