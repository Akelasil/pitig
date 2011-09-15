require 'test_helper'

class Admin::ColeccionsControllerTest < ActionController::TestCase
  # Especifico fixtures que deben cargarse
  fixtures :'admin/coleccions'

  setup do
    @admin_coleccion = admin_coleccions(:admin_colecciones_001)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_coleccions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  #######################################################
  # Test para comprobar que se crea una nueva coleccion #
  #######################################################
  test "Deberia crear una nueva coleccion" do
    num_colecciones = Admin::Coleccion.count
    assert_difference('Admin::Coleccion.count') do
      post :create, :admin_coleccion => {:nombre => 'Coches',
                                         :descripcion => 'Coleccion de coches antiguos'}
    end

    assert_redirected_to admin_coleccion_path(assigns(:admin_coleccion))
    assert_equal num_colecciones+1, Admin::Coleccion.count
  end

  
  ####################################################
  # Test para comprobar que se muestra una coleccion #
  ####################################################
  test "Deberia poder mostrar una coleccion" do
    get :show, :id => @admin_coleccion.to_param
    assert_response :success
    assert_template 'coleccions/show'
    assert_equal "Flores", assigns(:admin_coleccion).nombre
    assert_equal "Distintas flores de la Alameda.", assigns(:admin_coleccion).descripcion
  end


  test "should get edit" do
    get :edit, :id => @admin_coleccion.to_param
    assert_response :success
  end


  ####################################################
  # Test para comprobar que se muestra una coleccion #
  ####################################################
  test "Deberia poder actualizar una coleccion" do
    put :update, :id => @admin_coleccion.to_param, :admin_coleccion => @admin_coleccion.attributes
    assert_response :redirect
    assert_redirected_to admin_coleccion_path(assigns(:admin_coleccion))
    assert_equal "Flores", Admin::Coleccion.find(@admin_coleccion.to_param).nombre
  end

  test "should destroy admin_coleccion" do
    assert_difference('Admin::Coleccion.count', -1) do
      delete :destroy, :id => @admin_coleccion.to_param
    end

    assert_redirected_to admin_coleccions_path
  end
end
