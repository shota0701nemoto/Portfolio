class AddCarbToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :carb, :string
  end
end
