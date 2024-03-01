class AddPublicCreatedAt < ActiveRecord::Migration[7.1]
  def change
    add_column :logs, :public_created_at, :datetime
  end
end
