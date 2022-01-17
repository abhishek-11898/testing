class CreateFreindships < ActiveRecord::Migration[6.1]
  def change
    create_table :freindships do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.integer :freind_id

      t.timestamps
    end
  end
end
