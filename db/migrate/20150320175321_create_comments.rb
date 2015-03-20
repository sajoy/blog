class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :post_id, :integer
      t.column :name, :string
      t.column :content, :string
      t.timestamps
    end
  end
end
