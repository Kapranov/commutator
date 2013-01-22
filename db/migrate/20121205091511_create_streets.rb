class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.column :street, 'varchar(64)', :null => false
      t.integer :city_id

      t.timestamps
    end
  end
end
