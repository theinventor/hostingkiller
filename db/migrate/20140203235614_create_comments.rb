class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :support_request_id
      t.string :from
      t.text :body

      t.timestamps
    end
  end
end
