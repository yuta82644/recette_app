class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :date
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
