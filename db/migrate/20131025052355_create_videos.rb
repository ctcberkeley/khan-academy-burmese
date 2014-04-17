class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_id
      t.string :subject
      t.string :course
      t.string :title
      t.integer :translator_id
      t.integer :typer_id
      t.integer :qa_id
      t.boolean :translate_complete
      t.boolean :type_complete
      t.boolean :qa_complete

      t.timestamps
    end
  end
end
