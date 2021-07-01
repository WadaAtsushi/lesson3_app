class AddEvevtToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :event, :string
  end
end
