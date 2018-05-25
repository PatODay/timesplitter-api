class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :category
      t.date :date
      t.boolean :is_completed
      t.string :location
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
