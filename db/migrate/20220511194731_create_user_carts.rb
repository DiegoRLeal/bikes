class CreateUserCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
