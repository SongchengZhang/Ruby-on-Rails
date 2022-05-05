class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :term
      t.string :effectiveDate
      t.string :effectiveStatus
      t.string :title
      t.string :shortDescription
      t.text :description
      t.string :equivalentId
      t.string :allowMultiEnroll
      t.integer :maxUnits
      t.integer :minUnits
      t.integer :repeatUnitsLimit
      t.string :grading
      t.string :component
      t.string :primaryComponent
      t.string :offeringNumber
      t.string :subject
      t.string :catalogNumber
      t.string :campus
      t.string :academicOrg
      t.string :academicCareer
      t.string :cipCode
      t.string :campusCode
      t.string :catalogLevel
      t.string :subjectDesc
      t.string :courseId
      t.string :instructor_email
      t.integer :maxNumber , default: 0
      t.integer :graderNumber, default: 0

      t.timestamps
    end
  end
end
