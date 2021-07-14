class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :event_type
      t.boolean :public
      t.string :repo_id
      t.string :actor_id

      t.timestamps
    end
  end
end
