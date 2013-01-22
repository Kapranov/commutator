class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.date :install

      t.column :active, 'varchar(11)', :null => false, :default => 'prepared'
      t.column :multicast, 'varchar(11)', :null => false, :default => 'must'
      t.column :house, 'varchar(16)', :null => false
      t.column :porch, 'tinyint(3)', :null => false, :default => '1'
      t.column :login, 'varchar(16)', :null => false
      t.column :password, 'varchar(16)', :null => false
      t.column :mac, 'varchar(18)', :null => false
      t.column :serial, 'varchar(64)', :null => false
      t.column :snmpw, 'varchar(16)', :null => false
      t.column :num, 'tinyint(3)', :null => false, :default => '1'
      t.column :pos, 'tinyint(3)', :null => false, :default => '1'
      t.integer :statport_id
      t.integer :model_id
      t.integer :city_id
      t.integer :street_id

      t.timestamps
    end
  end
end
