class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :job
      t.integer :role
      t.string :email

      t.timestamps
    end
  end
end
