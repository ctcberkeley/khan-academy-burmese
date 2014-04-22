class AddTokenToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :trans_prog, :boolean
    add_column :videos, :digi_prog, :boolean
    add_column :videos, :qa_prog, :boolean
  end
end
