class CreateJoinTableUsersUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :admins, :freinds, table_name: :users_users do |t|
      t.index [:admin_id, :freind_id]
      t.index [:freind_id, :admin_id]
    end
  end
end