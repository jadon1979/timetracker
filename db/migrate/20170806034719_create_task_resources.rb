class CreateTaskResources < ActiveRecord::Migration[5.1]
  def change
    create_table :task_resources do |t|
      t.string :summary
      t.references :employee, foreign_key: true
      t.references :task, foreign_key: true
      t.float :hours

      t.timestamps
    end
  end
end
