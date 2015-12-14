# Devices present at home
class Device < ActiveRecord::Base
  belongs_to :device_model
  belongs_to :category, class_name: 'CategoryDevice'

  validates :name, presence: true, uniqueness: true
  validates_presence_of :device_model_id, :device_category_id

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
