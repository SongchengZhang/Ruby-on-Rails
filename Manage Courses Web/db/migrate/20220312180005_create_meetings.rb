class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.integer :meetingNumber
      t.integer :facilityId
      t.string :facilityType
      t.text :faciltyDescription
      t.string :facilityDescriptionShort
      t.string :facilityGroup
      t.integer :facilityCapacity
      t.string :buildingCode
      t.string :room
      t.text :buildingDescription
      t.string :buildingDescriptionShort
      t.string :startTime
      t.string :endTime
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :standingMeetingPattern


      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
