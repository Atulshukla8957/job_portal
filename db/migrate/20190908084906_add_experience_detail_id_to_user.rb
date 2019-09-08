class AddExperienceDetailIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :experience_detail_id, :integer
  end
end
