class AddTranslationHandwrittenToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :translation_handwritten, :string
  end
end
