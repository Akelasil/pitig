require 'test_helper'

class ObraTest < ActionDispatch::IntegrationTest
  # Especifico fixtures que deben cargarse
  fixtures :'admin/artista'
  fixtures :'admin/coleccions'
  fixtures :'admin/obras'


   # Comprueba el correcto funcionamiento de la administración de obras
  test "Gestión de obras" do
    coleccion = Admin::Coleccion.create(:nombre => 'Animales',
                                        :descripcion => 'Distintas especies de animales.')

    artista = Admin::Artistum.create(:i_alias => 'Marcos Torres',
				     :nombre => 'Marcos Torres Sanz',
				     :curriculum => 'Nació en Sevilla en 1955')

    usuario = new_session_as(:usuario)

    obra_nueva = usuario.add_obra :obra => {
	                :titulo => 'Gato pardo',
                        :anio_realizacion => 2010,
                        :medidas => '20 x 20',
			:seccion => 'Pintura',
			:tecnica => 'Oleo',
			:precio => 35.50,
			:admin_coleccion_id => coleccion.id,
			:admin_artistum_id => artista.id 
    }

    usuario.list_obras
   # usuario.show_obra obra_nueva

    

    usuario2 = new_session_as(:Juan)
    usuario2.delete_obra obra_nueva
  end


  private

  module ObraTestDSL
    attr_writer :name

    def list_obras
      get "/admin/obras"
      assert_response :success
      assert_template "admin/obras/index"
    end

    def add_obra(parameters)
      coleccion = Admin::Coleccion.find(:all).first
      artista = Admin::Artistum.find(:all).first

      get "/admin/obras/new"
      assert_response :success
      assert_template "obras/new"

      assert_tag :tag => 'option', :attributes => {:value => coleccion.id}
      assert_tag :tag => 'option', :attributes => {:value => artista.id}

      post "/admin/obras", parameters

      return Admin::Obra.find_by_titulo(parameters[:obra][:titulo])
    end

    def delete_obra(obra)
      post "/admin/obras/destroy/#{obra.id}"
      assert_response :redirect
      follow_redirect!
      assert_template "admin/obra/index"
    end


    def show_obra(obra)
      get "/admin/obras/show/#{obra.id}"
      assert_response :success
      assert_template "admin/obras/show"
    end

    def edit_obra(obra, parameters)
        get "/admin/obras/edit/#{obra.id}"
        assert_response :success
        assert_template "admin/obras/edit"
        
        post "/admin/obra/update/#{obra.id}", parameters
        assert_response :redirect
        follow_redirect!
        assert_response :success
        assert_template "admin/obras/show"
      end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(ObraTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
