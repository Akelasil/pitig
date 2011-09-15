module Admin::ObrasHelper

   # Para alternar el orden de clasificación de las columnas 
   def sortable(title, column)   
     css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
     direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
     link_to title, {:sort => column, :direction => direction}, {:class => css_class}  
   end 

end
