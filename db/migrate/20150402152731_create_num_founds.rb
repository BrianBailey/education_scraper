class CreateNumFounds < ActiveRecord::Migration
  def change
    create_table :num_founds do |t|
      t.string :value

      t.timestamps null: false
    end
  end
end
