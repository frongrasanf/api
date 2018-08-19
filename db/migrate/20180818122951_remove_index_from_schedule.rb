class RemoveIndexFromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :index, :string
  end
end
