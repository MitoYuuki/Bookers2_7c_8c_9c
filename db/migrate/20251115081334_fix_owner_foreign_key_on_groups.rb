class FixOwnerForeignKeyOnGroups < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :groups, column: :owner_id
    add_foreign_key :groups, :users, column: :owner_id
  end
end
