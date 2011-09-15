require 'test_helper'

class Admin::ArtistaControllerTest < ActionController::TestCase
  # Especifico fixtures que deben cargarse
  fixtures :'admin/artista'

  setup do
    @admin_artistum = admin_artista(:admin_artista_002)
  end


  ####################################################
  # Test para comprobar que se obtiene la página con #
  # el listado de los artistas con todos sus campos  #
  ####################################################
  test "Deberia poder obtener indice" do
    get :index

    # Comprueba que la respuesta a la peticion devolvera el codigo 200
    assert_response :success

    # Comprueba que se renderiza la pagina usando la vista adecuada
    assert_template 'admin/artista/index'

    # Comprueba la existencia de la instancia de la variable :admin_artista
    assert_not_nil assigns(:admin_artistum)
  end


  #######################################################
  # Test para comprobar que se captura un nuevo artista #
  #######################################################
  test "Deberia poder capturar un nuevo artista" do
    get :new

    # Comprueba que se renderiza la pagina usando la vista adecuada
    assert_template 'admin/artista/new'
    
    # Comprueba que la respuesta a la peticion devolvera el codigo de estado 200
    assert_response :success
  end


  ####################################################  
  # Test para comprobar que se crea un nuevo artista #
  ####################################################
  test "Deberia poder crear un nuevo artista" do
    num_artistas = Admin::Artistum.count

    # Comprobamos que el nuevo registro es creado en el modelo
    assert_difference('Admin::Artistum.count') do
      post :create, :admin_artistum => {:i_alias => 'Ana Torres',
					:nombre => 'Ana Torres Sanz',
                                        :curriculum => 'Nace en Cadiz'}
    end

    # Comprobamos que despues de crear el artista se nos redirige a sus datos
    assert_redirected_to admin_artistum_path(assigns(:admin_artistum))

    # Comprobamos que se ha aumentado el numero de artistas
    assert_equal num_artistas+1, Admin::Artistum.count
  end


  #################################################
  # Test para comprobar que se muestra un artista #
  #################################################
  test "Deberia mostrar un artista" do
    get :show, :id => @admin_artistum.to_param

    # Comprueba que la respuesta a la peticion devolvera el codigo 200
    assert_response :success

    # Comprueba que se renderiza la pagina usando la vista adecuada
    assert_template 'admin/artista/show'

    # Comprobamos que el artista mostrado es el correcto y sus datos tambien
    assert_equal "Lola Garcia", assigns(:admin_artistum).i_alias
    assert_equal "Dolores Garcia Sanchez", assigns(:admin_artistum).nombre    
  end


  ####################################################################
  # Test para comprobar que se puede editar un artista de la galeria #
  ####################################################################
  test "Deberia poder editar un artista de la galeria" do
    get :edit, :id => 2
    assert_response :success
    assert_tag :tag => 'input',
               :attributes => {:name => 'admin_artistum[i_alias]',
                               :value => 'Lola Garcia'}
    assert_tag :tag => 'input',
               :attributes => {:name => 'admin_artistum[nombre]',
                               :value => 'Dolores Garcia Sanchez'}
  end


  ##########################################################
  # Test para comprobar que se puede actualizar un artista #
  ##########################################################
  test "Deberia actualizar un artista" do
    put :update, :id => @admin_artistum.to_param, :admin_artistum => @admin_artistum.attributes

    # Comprobamos que como respuesta a la peticion se nos envia el    codigo :redirect
    assert_response :redirect

    # Comprobamos que despues de crear el artista se nos redirige a sus datos
    assert_redirected_to admin_artistum_path(assigns(:admin_artistum))

    # Comprobamos que los datos se han actualizado en el modelo
    assert_equal "Dolores Garcia Sanchez", Admin::Artistum.find(@admin_artistum.to_param).nombre
  end


  ########################################################
  # Test para comprobar que se puede destruir un artista #
  ########################################################
  test "Deberia destruir un artista" do
    # Comprobamos que se elimina el registro del modelo
    assert_difference('Admin::Artistum.count', -1) do
      delete :destroy, :id => @admin_artistum.to_param
    end

   # Comprobamos que como respuesta a la peticion se nos envia el codigo :redirect
    assert_response :redirect

    # Comprobamos que tras la eliminacion se nos redirige al listado de artistas
    assert_redirected_to admin_artista_path
  end
end
