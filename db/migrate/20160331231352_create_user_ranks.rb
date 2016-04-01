class CreateUserRanks < ActiveRecord::Migration
  def change
    create_table :user_ranks do |t|
      t.integer :level
      t.string :name

      t.timestamps null: false
    end
  end
end
