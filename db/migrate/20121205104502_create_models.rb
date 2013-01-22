class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.column :manufacturer, 'varchar(64)', :null => false
      t.column :model, 'varchar(32)', :null => false

      t.timestamps
    end
  end
end
