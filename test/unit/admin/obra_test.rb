require 'test_helper'

class Admin::ObraTest < ActiveSupport::TestCase
  # Especifico fixtures que deben cargarse
  fixtures :'admin/artista'
  fixtures :'admin/coleccions'
  fixtures :'admin/obras'

  # Test para el titulo de la obra
  test "Test titulo de la obra" do
    obra = Admin::Obra.create(:titulo => 'Gato pardo')
    assert_equal 'Gato pardo', obra.titulo
  end

  # Test para el año de realizacion de la obra
  test "Test año de realizacion de la obra" do
    obra = Admin::Obra.create(:anio_realizacion => 2010)
    assert_equal 2010, obra.anio_realizacion
  end

  # Test para las medidas de la obra
  test "Test medidas de la obra" do
    obra = Admin::Obra.create(:medidas => '20 x 20')
    assert_equal '20 x 20', obra.medidas
  end

  # Test para el precio de la obra
  test "Test precio de la obra" do
    obra = Admin::Obra.create(:precio => 35.50)
    assert_equal 35.50, obra.precio
  end

  # Test para comprobar que no puede guardarse una obra sin parámetros
  test "Test no guardar obra sin parametros" do
    obra = Admin::Obra.new()
    assert !obra.save, "Guardado obra sin parametros"
  end


  # Test para comprobar que no puede guardarse una obra sin titulo
  test "Test no guardar obra sin titulo" do
    obra = Admin::Obra.new(#:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra sin titulo"
  end

  # Test para comprobar que no puede guardarse una obra sin año de realizacion
  test "Test no guardar obra sin año de realizacion" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        #:anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra sin año de realizacion"
  end

  # Test para comprobar que no puede guardarse una obra sin medidas
  test "Test no guardar obra sin medidas" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        #:medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra sin medidas"
  end

  # Test para comprobar que no puede guardarse una obra sin seccion
  test "Test no guardar obra sin seccion" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			#:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra sin seccion"
  end

  # Test para comprobar que no puede guardarse una obra sin precio
  test "Test no guardar obra sin precio" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo'
			#:precio => 35.50 
			)
    assert !obra.save, "Guardado obra sin precio"
  end


  # Test para comprobar que no puede guardarse una obra con el título en blanco
  test "Test no guardar obra con titulo en blanco" do
    obra = Admin::Obra.new(:titulo => '',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con titulo en blanco"
  end

  # Test para comprobar que no puede guardarse una obra con el año de realizacion en blanco
  test "Test no guardar obra con anio de realizacion en blanco" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => '',
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con año de realizacion en blanco"
  end

  # Test para comprobar que no puede guardarse una obra con las medidas en blanco
  test "Test no guardar obra con medidas en blanco" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con medidas en blanco"
  end

  # Test para comprobar que no puede guardarse una obra con la seccion en blanco
  test "Test no guardar obra con seccion en blanco" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => '',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con seccion en blanco"
  end

  # Test para comprobar que no puede guardarse una obra con el precio en blanco
  test "Test no guardar obra con precio en blanco" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => '')
    assert !obra.save, "Guardado obra con año de realizacion en blanco"
  end


  # Test para comprobar que no puede guardarse un titulo con más de 255 caracteres
  test "Test no puede guardarse titulo con mas de 255 caracteres" do
    obra = Admin::Obra.new(:titulo => 'L' * 256,
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con titulo de mas de 255 caracteres"
  end

  # Test para comprobar que no puede guardarse la seccion con más de 255 caracteres
  test "Test no puede guardarse seccion con mas de 255 caracteres" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'L' * 256,
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con seccion de mas de 255 caracteres"
  end

  # Test para comprobar que no puede guardarse la tecnica con más de 255 caracteres
  test "Test no puede guardarse tecnica con mas de 255 caracteres" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'L' * 256,
			:precio => 35.50)
    assert !obra.save, "Guardado obra con tecnica de mas de 255 caracteres"
  end

  # Test para comprobar que no puede guardarse las medidas con más de 255 caracteres
  test "Test no puede guardarse medidas con mas de 255 caracteres" do
    obra = Admin::Obra.new(:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => 'L' * 256,
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50)
    assert !obra.save, "Guardado obra con tecnica de mas de 255 caracteres"
  end


  # Test para verificar que se puede acceder a una conjunto de obras desde una coleccion
  test "has_many_and_belongs_to" do
    # Mira en las colecciones y verifica que hay una obra en el conjunto de obras insertada por fixture al comienzo del test.
    colecc = Admin::Coleccion.find_by_nombre("Flores")
    assert_equal 1, colecc.admin_obras.size

    # Creamos una nueva obra
    obra = Admin::Obra.new(
	:titulo => 'Rosa roja',
        :anio_realizacion => 2008,
        :medidas => '20 x 15',
	:seccion => 'Pintura',
	:tecnica => 'Acuarela',
	:precio => 32.00)

    # Añadimos la nueva obra a la coleccion
    colecc.admin_obras << obra

    # Recargamos en la BD los datos
    colecc.reload
    obra.reload

    # Verificamos que ahora hay dos obras para la coleccion
    assert_equal 2, colecc.admin_obras.size
end


end
