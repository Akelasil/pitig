class Admin::Obra < ActiveRecord::Base
  # Relacion de uno a uno entre obras y artistas
  # Una obra tiene un solo artista
  belongs_to :admin_artistum, :class_name => "Artistum" # Están en el mismo espacio de nombres

  # Relacion de uno a uno entre obras y colecciones
  # Una obra en particular puede tener una sola coleccion
  belongs_to :admin_coleccion, :class_name => "Coleccion" # Están en el mismo espacio de nombres


  ### Paperclip ###
  has_attached_file :imagen, 
	:path => ":rails_root/public/images/:attachment/:id/:style.:extension",
	:url => "/images/:attachment/:id/:style.:extension",
	:styles => {
		:thumb =>  "50x50#",
		:medium => "100x100>",
		:large =>  "300x300>"
	}


  ### Validacion de datos ###
  # Restringimos los strings a 255 caracteres
  validates_length_of :titulo, :in => 1..255
  validates_length_of :seccion, :in => 1..255
  validates_length_of :tecnica, :in => 0..255
  validates_length_of :medidas, :in => 1..255
  validates_length_of :referencia, :in => 1..255

  # Ningún campo podrá estar en blanco o vacío
  validates_presence_of :titulo
  validates_presence_of :referencia
  validates_presence_of :seccion
  validates_presence_of :anio_realizacion
  validates_presence_of :medidas
  validates_presence_of :precio
  validates_presence_of :admin_artistum
  validates_presence_of :admin_coleccion

  # Asociacion
  validates_associated :admin_artistum, :admin_coleccion

  # Debe ser un numero
  validates_numericality_of :precio

  # Valor unico
  validates_uniqueness_of :referencia

  # Paperclip
  validates_attachment_presence :imagen
  validates_attachment_content_type :imagen, :content_type=>['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :imagen, :greater_than => 1.kilobyte

  # Obras mas recientes
  def self.latest
    find :all, :limit => 12, :order => "admin_obras.id desc",
     	 :include => [:admin_artistum, :admin_coleccion]
  end

end

