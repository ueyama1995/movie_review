class RemoveCustomerIdFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :customer_id, :integer
  end
end
