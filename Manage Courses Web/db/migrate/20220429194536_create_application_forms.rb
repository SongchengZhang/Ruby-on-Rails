class CreateApplicationForms < ActiveRecord::Migration[7.0]
  def change
    create_table :application_forms do |t|

      t.text :details
      t.text :qualifications
      
      t.string :userEmail
      t.timestamps
    end
  end
end
