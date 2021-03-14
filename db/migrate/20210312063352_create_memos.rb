class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.integer :room_id, null: false
      t.timestamps
    end
  end
end
