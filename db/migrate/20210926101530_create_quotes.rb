class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.references :user
      t.references :job

      t.timestamps
    end
  end
end
