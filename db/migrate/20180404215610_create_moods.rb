class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :mood
      t.string :url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
