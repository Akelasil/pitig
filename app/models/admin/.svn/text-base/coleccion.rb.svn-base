class Admin::Coleccion < ActiveRecord::Base
  # Relacion de uno a muchos entre colecciones y obras
  # Una coleccion puede tener una o varias obras
  has_many :admin_obras, :class_name => "Obra" #, :foreign_key => 'admin_coleccions_id' # Están en el mismo espacio de nombres


  ### Validacion de datos ###
  # Restringimos los strings a 255 caracteres
  validates_length_of :nombre, :in => 1..255
  validates_length_of :descripcion, :in => 1..500

  # Ningún campo podrá estar en blanco o vacío
  validates_presence_of :nombre

  # Valor unico
  validates_uniqueness_of :nombre
end
