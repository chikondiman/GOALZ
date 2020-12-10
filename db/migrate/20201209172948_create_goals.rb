class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :intention
      t.string :goalKeeper
      t.datetime :startTime
      t.datetime :endTime
      t.boolean :completed
      t.integer :goalCohort

      t.timestamps
    end
  end
end
