class CreateCourseAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :course_attributes do |t|
      t.string :name
      t.string :value
      t.text :description
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
