class CreateAdminColeccions < ActiveRecord::Migration
  def self.up
    create_table :admin_coleccions do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps   
    end

    # Añadiendo coleccion por defecto
    execute(insert_sin_coleccion)

  end

  def self.down
    drop_table :admin_coleccions
  end


  # Añadir datos a la tabla coleccion por defecto
  def self.insert_sin_coleccion
    <<-END_OF_DATA
       insert into admin_coleccions (nombre, descripcion) values
         ("Ninguna", "No pertenece a ninguna colección")
    END_OF_DATA
  end

end
