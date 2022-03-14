class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.text :comment
      t.string :payment_method
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
