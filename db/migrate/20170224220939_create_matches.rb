class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :mentor, class_name: "Mentor"
      t.references :mentee, class_name: "Mentee"
      t.timestamps
    end
  end
end
