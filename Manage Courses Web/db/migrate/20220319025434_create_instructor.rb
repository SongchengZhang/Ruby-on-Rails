class CreateInstructor < ActiveRecord::Migration[7.0]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :student_num
      t.text :description
      
      t.timestamps
    end
  end
end
