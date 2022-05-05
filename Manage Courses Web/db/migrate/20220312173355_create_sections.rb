class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :classNumber
      t.string :section
      t.string :instructionMode
      t.integer :courseOfferingNumber
      t.string :academicGroup
      t.string :subject
      t.string :career
      t.string :description
      t.string :enrollmentStatus
      t.string :type
      t.string :associatedClass
      t.boolean :autoEnrollWaitlist
      t.boolean :autoEnrollSection1
      t.boolean :autoEnrollSection2
      t.boolean :consent
      t.integer :waitlistCapacity
      t.integer :minimumEnrollment
      t.integer :enrollmentTotal
      t.integer :waitlistTotal
      t.string :academicOrg
      t.string :location
      t.string :equivalentCourseId
      t.string :startDate
      t.string :endDate
      t.string :cancelDate
      t.string :primaryInstructorSession
      t.string :combinedSection
      t.string :holidaySchedule
      t.string :sessionCode
      t.string :sessionDescription

      t.string :secCampus
      t.string :secAcademicGroup
      t.string :secCatalogNumber
      t.string :meetingDays
      t.string :subjectDesc
      t.string :termCode
 
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
