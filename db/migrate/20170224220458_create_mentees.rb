class CreateMentees < ActiveRecord::Migration[5.0]
  def change
    create_table :mentees do |t|
      t.string :name
      t.string :email
      t.text :objective
      t.boolean :mentor_demographic_pref
      t.string :race
      t.string :gender
      t.string :class
      t.string :orientation
      t.string :other
      t.string :location
      t.text :interests
      t.boolean :good_standing

      t.timestamps
    end
  end
end
