class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :summary
      t.text :description
      t.integer :story_points
      t.references :project, foreign_key: true, default: 0
      t.integer :creator_id, default: 0, index: true
      t.timestamps
    end
  end
end
