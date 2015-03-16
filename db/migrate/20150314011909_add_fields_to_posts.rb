class AddFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :chamber, :string
    add_column :posts, :title, :text
    add_column :posts, :date, :text
    add_column :posts, :origin_url, :string
    add_column :posts, :number, :integer
    add_column :posts, :order, :integer
    add_column :posts, :volume, :integer
    add_column :posts, :pages, :string
    add_column :posts, :bioguide_id, :string
    add_column :posts, :speaker_raw, :string
  end
end
