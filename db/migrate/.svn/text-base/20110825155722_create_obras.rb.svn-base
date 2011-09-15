class CreateObras < ActiveRecord::Migration
  def self.up
    create_table :admin_obras do |t|
      t.string :titulo
      t.string :referencia
      t.date :anio_realizacion
      t.string :medidas
      t.string :seccion
      t.string :tecnica
      t.decimal :precio, :precision => 11, :scale => 2	# Double con 2 decimales
      t.text :comentario
      t.references :admin_coleccion
      t.references :admin_artistum

      t.timestamps
    end

  end

  def self.down
    drop_table :admin_obras
  end
end
