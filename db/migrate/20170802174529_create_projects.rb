class CreateProjects < ActiveRecord::Migration[5.1]
  create_table :projects do |t|
    t.string :name
    t.references :project_status, foreign_key: true, default: 0
    t.string :summary
    t.text :description
    t.integer :creator_id, default: 0, index: true
    t.boolean :archived, default: false

    t.timestamps
  end
end
