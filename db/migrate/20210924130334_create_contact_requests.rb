class CreateContactRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_requests do |t|
      t.references :job
      t.references :user
      t.string :purpose

      t.timestamps
    end
  end
end
