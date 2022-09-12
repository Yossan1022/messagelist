class AddTitleToMessages < ActiveRecord::Migration[6.1]
  def change
    #title カラムを string(VARCHAR(255))のデータ型で追加
    add_column :messages, :title, :string
  end
end
