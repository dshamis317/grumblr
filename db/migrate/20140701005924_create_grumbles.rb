class CreateGrumbles < ActiveRecord::Migration
  def change
    create_table :grumbles do |t|
     t.string :grumble
     t.integer :user_id
     t.timestamps
   end
  end
end
