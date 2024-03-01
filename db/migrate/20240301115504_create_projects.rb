class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true

      t.string :name, null: false
      t.string :api_key, null: false

      t.timestamps
    end
  end
end
