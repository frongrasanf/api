class AddStartAtToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :start_at, :datetime, default: nil
  end
end
