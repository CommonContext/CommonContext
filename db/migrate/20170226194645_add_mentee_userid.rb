class AddMenteeUserid < ActiveRecord::Migration[5.0]
  def change
    add_reference :mentees, :user, index: true
  end
end
