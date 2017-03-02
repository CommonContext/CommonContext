class CreateMentors < ActiveRecord::Migration[5.0]
  def change
    create_table :mentors do |t|
      t.string :name
      t.string :email
      t.integer :years_of_experience
      t.string :current_company
      t.string :current_industry
      t.string :linkedin_link
      t.datetime :availability
      t.string :race
      t.string :gender
      t.string :socioeconomic_background
      t.string :orientation
      t.string :other
      t.string :location
      t.text :interests
      t.boolean :good_standing

      t.timestamps
    end
  end
end
