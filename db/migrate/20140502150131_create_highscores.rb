class CreateHighscores < ActiveRecord::Migration
  def change
    create_table :highscores do |t|
      t.string :name
      t.integer :level
      t.integer :score
      t.string :ip

      t.timestamps
    end
  end
end
