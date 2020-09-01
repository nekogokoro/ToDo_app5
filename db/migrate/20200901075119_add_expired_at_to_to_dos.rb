class AddExpiredAtToToDos < ActiveRecord::Migration[6.0]
  def change
    add_column :to_dos, :expired_at, :datetime
  end
end
