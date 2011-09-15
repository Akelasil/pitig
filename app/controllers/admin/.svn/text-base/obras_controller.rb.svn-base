class Admin::ObrasController < ApplicationController
  helper_method :sort_column, :sort_direction 

  # GET /admin/obras
  # GET /admin/obras.xml
  def index
    # Paginacion con la gema 'will_paginate' y ordenacion
    @admin_obras = Admin::Obra.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_obras }
    end
  end

  # GET /admin/obras/1
  # GET /admin/obras/1.xml
  def show
    @admin_obra = Admin::Obra.find(params[:id])
    @page_title = ['Obra: \'',@admin_obra.titulo,'\'']   

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_obra }
    end
  end

  # GET /admin/obras/new
  # GET /admin/obras/new.xml
  def new
    load_data
    @admin_obra = Admin::Obra.new
    @page_title = 'Nueva Obra'
    @action = 'Crear Obra'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_obra }
    end
  end

  # GET /admin/obras/1/edit
  def edit
    load_data
    @admin_obra = Admin::Obra.find(params[:id])
    @page_title = ['Edicion de la Obra \'',@admin_obra.titulo,'\'']
    @action = 'Actualizar Obra'
  end

  # POST /admin/obras
  # POST /admin/obras.xml
  def create
    @admin_obra = Admin::Obra.new(params[:admin_obra])
    @action = 'Crear Obra'

    respond_to do |format|
      if @admin_obra.save
        format.html { redirect_to(@admin_obra, :notice => "La obra '#{@admin_obra.titulo}' ha sido creada satisfactoriamente.") }
        format.xml  { render :xml => @admin_obra, :status => :created, :location => @admin_obra }
      else
	@page_title = 'Crear Nueva Obra'
        load_data
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_obra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/obras/1
  # PUT /admin/obras/1.xml
  def update
    @admin_obra = Admin::Obra.find(params[:id])
    @action = 'Actualizar Obra'

    respond_to do |format|
      if @admin_obra.update_attributes(params[:admin_obra])
        format.html { redirect_to(@admin_obra, :notice => "La obra '#{@admin_obra.titulo}' han sido actualizada.") }
        format.xml  { head :ok }
      else
        @page_title = ['Edicion de la Obra \'',@admin_obra.titulo,'\'']
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_obra.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/obras/1
  # DELETE /admin/obras/1.xml
  def destroy
    @admin_obra = Admin::Obra.find(params[:id])
    @admin_obra.destroy

    respond_to do |format|
      format.html { redirect_to(admin_obras_url) }
      format.xml  { head :ok }
    end
  end


  private	# Uso interno por el controlador

  def load_data
    @admin_artistas = Admin::Artistum.find(:all)
    @admin_coleccions = Admin::Coleccion.find(:all)
  end

  def sort_column
    Admin::Obra.column_names.include?(params[:sort]) ? params[:sort] : "titulo" 
  end  
     
  def sort_direction   
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end  

end
