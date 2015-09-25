class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.references :role, index: true
      t.references :menu_option, index: true
      t.boolean :add
      t.boolean :update
      t.boolean :delete
      t.boolean :execute
      t.boolean :generate
      t.boolean :upload
      t.boolean :authorize
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
