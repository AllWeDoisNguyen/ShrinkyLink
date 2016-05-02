class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link, null: false

      t.timestamps null: false
    end
  end
end
