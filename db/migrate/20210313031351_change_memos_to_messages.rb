class ChangeMemosToMessages < ActiveRecord::Migration[6.0]
  def change
    rename_table :memos, :messages
  end
end
