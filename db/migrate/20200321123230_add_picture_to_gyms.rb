class AddPictureToGyms < ActiveRecord::Migration[6.0]
  def change
    add_column :gyms, :picture, :string
  end
end
