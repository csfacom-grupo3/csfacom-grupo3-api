class CreateProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_members do |t|
      t.references :role, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
