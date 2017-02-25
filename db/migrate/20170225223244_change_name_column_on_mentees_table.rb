class ChangeNameColumnOnMenteesTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :mentees, :name, :first_name
  end
end
