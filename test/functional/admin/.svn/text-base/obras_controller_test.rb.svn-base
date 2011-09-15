require 'test_helper'

class Admin::ObrasControllerTest < ActionController::TestCase
  # Especifico fixtures que deben cargarse
  fixtures :'admin/artista'
  fixtures :'admin/coleccions'
  fixtures :'admin/obras'

  setup do
    @admin_obra = admin_obras(:admin_obra_001)
    @admin_artista = admin_artista(:admin_artista_001)
    @admin_coleccion = admin_coleccions(:admin_colecciones_002)
  end


  ########################################################################   
  # Test para comprobar que se obtiene la página con el listado de obras #
  ######################################################################## 
  test "Deberia obtener indice" do
    get :index
    assert_response :success
    assert_template 'admin/obras/index'
    assert_not_nil assigns(:admin_obras)
  end


  #####################################################  
  # Test para comprobar que se captura una nueva obra #
  ##################################################### 
  test "Deberia capturar una nueva obra" do
    get :new
    assert_template 'admin/obras/new'
    assert_response :success
  end


  ##################################################  
  # Test para comprobar que se crea una nueva obra #
  ##################################################  
  test "Deberia crear una nueva obra" do
    get :new
    assert_template 'admin/obras/new'
    num_discos = Admin::Obra.count
    post :create, :admin_obra => {:titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50}

    assert_equal num_discos, Admin::Obra.count
  end


  ###############################################
  # Test para comprobar que se muestra una obra #
  ###############################################
  test "Deberia mostrar una obra" do
    get :show, :id => @admin_obra.to_param
    assert_response :success
    assert_template 'admin/obras/show'
    assert_equal "Gato pardo", assigns(:admin_obra).titulo
    assert_equal "Pintura", assigns(:admin_obra).seccion
  end


  ####################################################
  # Test para comprobar que se puede editar una obra #
  ####################################################
  test "Deberia editar una obra" do
    get :edit, :id => 2
    assert_response :success
    assert_tag :tag => 'input',
               :attributes => {:name => 'admin_obra[titulo]',
                               :value => 'Rosa blanca'}
  end


  ########################################################
  # Test para comprobar que se puede actualizar una obra #
  ########################################################
  test "Deberia actualizar una obra" do
    put :update, :id => @admin_obra.to_param, :admin_obra => @admin_obra.attributes
    assert_equal "Gato pardo", Admin::Obra.find(@admin_obra.to_param).titulo
  end


  ######################################################
  # Test para comprobar que se puede destruir una obra #
  ######################################################
  test "Deberia poder destruir una obra" do
    assert_difference('Admin::Obra.count', -1) do
      delete :destroy, :id => @admin_obra.to_param
    end
    
    assert_response :redirect
    assert_redirected_to admin_obras_path
  end
end
