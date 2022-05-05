class CreateUserCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_courses do |t|

      t.integer :apply , default: 0
      t.integer :gApply , default: 0
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
