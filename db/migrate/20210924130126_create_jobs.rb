class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user
      t.references :creator, polymorphic: true
      t.string :url

      t.timestamps
    end
  end
end
