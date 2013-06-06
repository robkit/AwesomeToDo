class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :task
      t.date :due
      t.integer :priority
      t.boolean :status
      t.integer :list_id
      t.integer :collaborator_id
      t.integer :user_id
      t.integer :category_id
    end
  end
end
