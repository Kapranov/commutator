class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.column :city, 'varchar(34)', :null => false

      t.timestamps
    end
  end
end
