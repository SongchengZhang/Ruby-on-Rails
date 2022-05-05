class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.column "student_email", :string
      t.column "user_id", :integer
      t.column "course_id", :integer, null: true
      t.timestamps
    end
  end

  def self.down
    drop_table "recommendations"
  end
end
