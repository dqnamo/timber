class CreateEventsLogsAndUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :project, null: false, foreign_key: true

      t.string :name, null: false
      t.string :icon, null: false

      t.timestamps
    end

    create_table :identified_users do |t|
      t.references :project, null: false, foreign_key: true

      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :username

      t.string :external_id, null: false

      t.timestamps
    end

    create_table :logs do |t|
      t.references :event, null: false, foreign_key: true

      t.references :identified_user, foreign_key: true
      t.string :message
      t.jsonb :metadata, null: false, default: {}

      t.timestamps
    end
  end
end
