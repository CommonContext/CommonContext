class AddLastNameColumnToMenteesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :mentees, :last_name, :string
  end
end
