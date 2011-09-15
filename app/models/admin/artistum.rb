class Admin::Artistum < ActiveRecord::Base
  # Relacion de uno a muchos entre artistas y obras
  # Unn artista puede tener una o varias obras
  has_many :admin_obras, :class_name => "Obra" # Están en el mismo espacio de nombres

  ### Paperclip ###
  has_attached_file :foto, 
	:path => ":rails_root/public/images/:attachment/:id/:style.:extension",
	:url => "/images/:attachment/:id/:style.:extension",
	:styles => {
		:thumb =>  "50x50#",
		:medium => "100x100>",
		:large =>  "250x250>"
	}

  ### Validacion de datos ###
  # Restringimos los strings a 255 caracteres
  validates_length_of :i_alias, :in => 1..255
  validates_length_of :nombre, :in => 1..255

  # Ningún campo podrá estar en blanco o vacio
  validates_presence_of :i_alias
  validates_presence_of :nombre

  # Valor es unico
  validates_uniqueness_of :i_alias



  def nombre_completo
    i_alias + ' (' + nombre + ')'
  end
end
