require 'test_helper'

class CatalogoControllerTest < ActionController::TestCase
  # Especifico fixtures que deben cargarse
  fixtures :'admin/artista'
  fixtures :'admin/coleccions'
  fixtures :'admin/obras'

  setup do
    @admin_obra = admin_obras(:admin_obra_001)
    @admin_artista = admin_artista(:admin_artista_001)
    @admin_coleccion = admin_coleccions(:admin_colecciones_002)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @admin_obra.to_param
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get latest" do
    get :latest
    assert_response :success
  end

end
