class AddUniqueConstrainttoProjects < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :project_id], :unique =>true

  end
end
