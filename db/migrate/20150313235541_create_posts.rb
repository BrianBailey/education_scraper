class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :speaker_state
      t.string :speaker_first
      t.string :speaker_last
      t.string :speaker_party
      t.text :speaking

      t.timestamps null: false
    end
  end
end
