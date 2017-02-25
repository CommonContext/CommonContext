class ChangeNameColumnOnMentorsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :mentors, :name, :first_name
  end
end
