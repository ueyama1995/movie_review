class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :kana_last_name
      t.string :kana_first_name
      t.string :nickname
      t.string :email
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
