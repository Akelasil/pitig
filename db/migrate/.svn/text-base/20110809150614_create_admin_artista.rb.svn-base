class CreateAdminArtista < ActiveRecord::Migration
  def self.up
    create_table :admin_artista do |t|
      t.string :i_alias
      t.string :nombre
      t.text :curriculum

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_artista
  end
end
