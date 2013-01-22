class CreateStatports < ActiveRecord::Migration
  def change
    create_table :statports do |t|
      t.column :ip, 'varchar(32)', :null => false
      t.column :g1cli, 'tinyint(3)', :null => false, :default => '0'
      t.column :g1free, 'tinyint(3)', :null => false, :default => '0'
      t.column :g1leased, 'tinyint(3)', :null => false, :default => '0'
      t.column :g1trunk, 'tinyint(3)', :null => false, :default => '0'
      t.column :pbad, 'tinyint(3)', :null => false, :default => '0'
      t.column :pbadlist, 'varchar(32)', :null => false, :default => '0'
      t.column :pfree, 'tinyint(3)', :null => false, :default => '0'
      t.column :phome, 'tinyint(3)', :null => false, :default => '0'
      t.column :pleased, 'tinyint(3)', :null => false, :default => '0'
      t.column :sigport, 'tinyint(3)', :null => false, :default => '0'
      t.integer :model_id
      t.integer :city_id
      t.integer :street_id

      t.timestamps
    end
  end
end
