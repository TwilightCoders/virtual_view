ActiveRecord::Schema.define do
  self.verbose = false

  create_table :users, schema: :public, force: true do |t|
    t.string :name
    t.string :email, index: :btree
    t.timestamps null: false, virtual_view: true
    t.timestamp :deleted_at
  end

  create_table :comments, force: true do |t|
    t.string :title
    t.integer :user_id
    t.integer :post_id
    t.timestamps null: false
  end

end
