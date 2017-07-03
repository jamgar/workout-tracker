class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :date
      t.integer :duration
      t.text :note
      t.integer :user_id
      t.timestamps
    end
  end
end
