class CreatePerPages < ActiveRecord::Migration
  def change
    create_table :per_pages do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
