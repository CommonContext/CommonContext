class AddLastNameColumnToMentorsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :mentors, :last_name, :string
  end
end
