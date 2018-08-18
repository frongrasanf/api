class AddTitleToSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :title, :string
  end
end
