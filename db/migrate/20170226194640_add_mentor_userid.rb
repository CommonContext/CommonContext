class AddMentorUserid < ActiveRecord::Migration[5.0]
  def change
    add_reference :mentors, :user, index: true
  end
end
