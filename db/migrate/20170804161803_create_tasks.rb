class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :summary
      t.boolean :completed, default: false
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
