class DropNamesFromCollaborator < ActiveRecord::Migration
  def change
  	remove_column :collaborators, :nickname
  	remove_column :collaborators, :name
  	add_column :collaborators, :list_id, :integer
  end
end
