# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110905101753) do

  create_table "admin_artista", :force => true do |t|
    t.string   "i_alias"
    t.string   "nombre"
    t.text     "curriculum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "admin_coleccions", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_obras", :force => true do |t|
    t.string   "titulo"
    t.string   "referencia"
    t.date     "anio_realizacion"
    t.string   "medidas"
    t.string   "seccion"
    t.string   "tecnica"
    t.decimal  "precio",              :precision => 11, :scale => 2
    t.text     "comentario"
    t.integer  "admin_coleccion_id"
    t.integer  "admin_artistum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

end