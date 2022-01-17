class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :number
      t.string :email
      t.text :bio
      t.string :password_digest
      t.integer :age   

      t.timestamps
    end
  end
end
