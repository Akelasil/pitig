require 'test_helper'

class Admin::ArtistumTest < ActiveSupport::TestCase
  # Especifico fixtures que deben cargarse
  fixtures :'admin/artista'

  # Test para el i_alias del artista
  test "Test i_alias" do
    artista = Admin::Artistum.create(:i_alias => 'Marcos Torres')
    assert_equal 'Marcos Torres', artista.i_alias
  end

  # Test para el nombre del artista
  test "Test nombre" do
 	artista = Admin::Artistum.create(:nombre => 'Marcos Torres Sanz')
    	assert_equal 'Marcos Torres Sanz', artista.nombre
  end

 
  # Test para el nombre completo del artista
  test "Test nombre completo" do
    artista = Admin::Artistum.create(:i_alias => 'Marcos Torres',
                   :nombre => 'Marcos Torres Sanz')
    assert_equal 'Marcos Torres (Marcos Torres Sanz)', artista.nombre_completo
  end
end
