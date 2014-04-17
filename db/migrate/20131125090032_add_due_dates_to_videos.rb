class AddDueDatesToVideos < ActiveRecord::Migration
  def change
  	add_column :videos, :due_date, :date
  end
end
