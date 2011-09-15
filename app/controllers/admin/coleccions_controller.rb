class Admin::ColeccionsController < ApplicationController
  helper_method :sort_column, :sort_direction 

  # GET /admin/coleccions
  # GET /admin/coleccions.xml
  def index
    # Paginacion con la gema 'will_paginate' y ordenacion
    @admin_coleccions = Admin::Coleccion.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_coleccions }
    end
  end

  # GET /admin/coleccions/1
  # GET /admin/coleccions/1.xml
  def show
    @admin_coleccion = Admin::Coleccion.find(params[:id])
    @page_title = ['Datos de la Colección \'', @admin_coleccion.nombre,'\'']

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_coleccion }
    end
  end

  # GET /admin/coleccions/new
  # GET /admin/coleccions/new.xml
  def new
    @admin_coleccion = Admin::Coleccion.new
    @page_title = 'Nueva Colección'
    @action = 'Crear Colección'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_coleccion }
    end
  end

  # GET /admin/coleccions/1/edit
  def edit
    @admin_coleccion = Admin::Coleccion.find(params[:id])
    @page_title = ['Edicion de la Colección \'',@admin_coleccion.nombre,'\'']
    @action = 'Actualizar Colección'
  end

  # POST /admin/coleccions
  # POST /admin/coleccions.xml
  def create
    @admin_coleccion = Admin::Coleccion.new(params[:admin_coleccion])
    @action = 'Crear Colección'

    respond_to do |format|
      if @admin_coleccion.save
        format.html { redirect_to(@admin_coleccion, :notice => "La colección '#{@admin_coleccion.nombre}' ha sido creada satisfactoriamente.") }
        format.xml  { render :xml => @admin_coleccion, :status => :created, :location => @admin_coleccion }
      else
        @page_title = 'Crear Nueva Colección'
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_coleccion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/coleccions/1
  # PUT /admin/coleccions/1.xml
  def update
    @admin_coleccion = Admin::Coleccion.find(params[:id])
    @action = 'Actualizar Colección'

    respond_to do |format|
      if @admin_coleccion.update_attributes(params[:admin_coleccion])
        format.html { redirect_to(@admin_coleccion, :notice => "Los datos de la \'#{@admin_coleccion.nombre}\' han sido modificados correctamente.") }
        format.xml  { head :ok }
      else
        @page_title = ['Edicion de la Coleccion \'',@admin_coleccion.nombre,'\'']
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_coleccion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/coleccions/1
  # DELETE /admin/coleccions/1.xml
  def destroy
    @admin_coleccion = Admin::Coleccion.find(params[:id])
    @admin_coleccion.destroy

    respond_to do |format|
      format.html { redirect_to(admin_coleccions_url) }
      format.xml  { head :ok }
    end
  end


  private	# Uso interno por el controlador

  def sort_column
    Admin::Coleccion.column_names.include?(params[:sort]) ? params[:sort] : "nombre" 
  end  
     
  def sort_direction   
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end  

end
