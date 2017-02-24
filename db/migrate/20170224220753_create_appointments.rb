class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.datetime :datetime
      t.string :location
      t.integer :mentor_rating
      t.integer :mentee_rating
      t.references :mentor, class_name: "Mentor"
      t.references :mentee, class_name: "Mentee"

      t.timestamps
    end
  end
end
