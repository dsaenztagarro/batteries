class AddAvatarColumnToDevices < ActiveRecord::Migration
  def up
    add_attachment :devices, :avatar
  end

  def down
    remove_attachment :devices, :avatar
  end
end
