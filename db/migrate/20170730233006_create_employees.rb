class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :role, foreign_key: true, default: 0
      
      t.timestamps
    end
  end
end
