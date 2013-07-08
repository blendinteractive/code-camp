class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.boolean :display

      t.timestamps
    end
  end
end
