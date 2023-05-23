class CreatePlaceVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :place_votes do |t|
      t.string :validity
      t.string :choice
      t.integer :time_of_vote
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
