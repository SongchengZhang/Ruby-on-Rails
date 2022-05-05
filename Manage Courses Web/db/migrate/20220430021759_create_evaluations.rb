class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.integer :instructor_id
      t.string :student_email
      t.string :body
      t.timestamps
    end
  end
end
