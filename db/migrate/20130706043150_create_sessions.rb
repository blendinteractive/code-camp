class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :speaker
      t.string :title
      t.text :abstract

      t.timestamps
    end
  end
end
