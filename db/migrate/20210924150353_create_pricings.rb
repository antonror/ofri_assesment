class CreatePricings < ActiveRecord::Migration[6.1]
  def change
    create_table :pricings do |t|
      t.references :user
      t.boolean :current
      t.string :version

      t.timestamps
    end
  end
end
