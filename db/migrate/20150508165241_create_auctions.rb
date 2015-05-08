class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :details
      t.date :ends_on
      t.float :reserve_price

      t.timestamps null: false
    end
  end
end
