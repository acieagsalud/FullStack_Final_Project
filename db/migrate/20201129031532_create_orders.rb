class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.decimal :gst
      t.decimal :pst
      t.decimal :total
      t.decimal :subtotal
      t.string :status
      t.string :stripe_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
