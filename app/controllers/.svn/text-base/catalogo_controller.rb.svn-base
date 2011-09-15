class CatalogoController < ApplicationController
  helper_method :sort_column, :sort_direction 

  def index   
    # Paginacion con la gema 'will_paginate' y ordenacion
    @admin_obras = Admin::Obra.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page], :per_page => 9)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_obras }
    end

  end

  def show
    @admin_obra = Admin::Obra.find(params[:id]) rescue nil
    @page_title = ['Obra: \'', @admin_obra.titulo,'\'']

    respond_to do |format|
      if @admin_obra
        format.html # show.html.erb
        format.xml  { render :xml => @admin_obra }
      else
        format.html { render :text => 'No encontrado', :status => 404 }
        format.xml  { render :xml => 'No encontrado', :status => 404 }
      end
    end
  end

  def search
   
  end

  def latest
    @admin_obras = Admin::Obra.latest
  end

  def rss
    @page_title = "Obras recientes"
    latest
    render :layout => false
  end


  private	# Uso interno por el controlador

  def sort_column
    Admin::Obra.column_names.include?(params[:sort]) ? params[:sort] : "titulo" 
  end  
     
  def sort_direction   
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
  end  

end
