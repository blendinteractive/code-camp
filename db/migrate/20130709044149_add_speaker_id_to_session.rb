class AddSpeakerIdToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :speaker_id, :integer
    remove_column :sessions, :speaker
  end
end
