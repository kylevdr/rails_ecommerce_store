class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.time :date_placed
      t.boolean :fulfilled
      t.time :date_fulfilled
      t.string :status

      t.timestamps
    end
  end
end
