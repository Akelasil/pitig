class Admin::ArtistaController < ApplicationController
  helper_method :sort_column, :sort_direction 

  # GET /admin/artista
  # GET /admin/artista.xml
  def index
    # Paginacion con la gema 'will_paginate' y ordenacion
    @admin_artistum = Admin::Artistum.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_artistum }
    end
  end

  # GET /admin/artista/1
  # GET /admin/artista/1.xml
  def show
    @admin_artistum = Admin::Artistum.find(params[:id])
    @page_title = ['Datos de \'',@admin_artistum.i_alias,'\'']

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_artistum }
    end
  end

  # GET /admin/artista/new
  # GET /admin/artista/new.xml
  def new
    @admin_artistum = Admin::Artistum.new
    @page_title = 'Nuevo/a Artista'
    @action = 'Crear Artista'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_artistum }
    end
  end

  # GET /admin/artista/1/edit
  def edit
    @admin_artistum = Admin::Artistum.find(params[:id])
    @page_title = ['Edicion del Artista \'',@admin_artistum.i_alias,'\'']
    @action = 'Actualizar Artista'
  end

  # POST /admin/artista
  # POST /admin/artista.xml
  def create
    @admin_artistum = Admin::Artistum.new(params[:admin_artistum])
    @action = 'Crear Artista'

    respond_to do |format|
      if @admin_artistum.save
        format.html { redirect_to(@admin_artistum, :notice => "El artista '#{@admin_artistum.i_alias}' ha sido creado satisfactoriamente.") }
        format.xml  { render :xml => @admin_artistum, :status => :created, :location => @admin_artistum }
      else
        @page_title = 'Crear Nuevo Artista'
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_artistum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/artista/1
  # PUT /admin/artista/1.xml
  def update
    @admin_artistum = Admin::Artistum.find(params[:id])
    @action = 'Actualizar Artista'

    respond_to do |format|
      if @admin_artistum.update_attributes(params[:admin_artistum])
        format.html { redirect_to(@admin_artistum, :notice => "Los datos de \'#{@admin_artistum.i_alias}\' han sido modificados correctamente.") }
        format.xml  { head :ok }
      else
        @page_title = ['Edicion del Artista \'',@admin_artistum.i_alias,'\'']
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_artistum.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /admin/artista/1
  # DELETE /admin/artista/1.xml
  def destroy
    @admin_artistum = Admin::Artistum.find(params[:id])
    if @admin_artistum.destroy
       respond_to do |format|
         format.html { redirect_to(admin_artista_url, :notice => "\'#{@admin_artistum.i_alias}\' ha sido eliminado correctamente.") }
         format.xml  { head :ok }
       end
    else
       respond_to do |format|
         flash[:error_notice] = "No se puede eliminar el Artista '#{@admin_artistum.i_alias}' porque se está empleando en un carrito de compra."
	 format.html { redirect_to(admin_artista_url) }
	 format.xml  { head :ok }
       end
    end
  end

  private	# Uso interno por el controlador

  # Para la ordenación
  def sort_column
    Admin::Artistum.column_names.include?(params[:sort]) ? params[:sort] : "i_alias" 
  end  
     
  def sort_direction   
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end  

end



