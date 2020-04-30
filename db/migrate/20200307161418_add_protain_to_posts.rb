class AddProtainToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :protein, :string
  end
end
