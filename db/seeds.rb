# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   roles = Role.create([{:role_type => "admin"}, {:role_type => "abogado"},{:role_type=>"socio"},
#    {:role_type => "itinerante"}])
#
##   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#oles = Role.create([{:role_type => "admin"}, {:role_type => "abogado"},{:role_type=>"socio"},
#    {:role_type => "itinerante"}])

dimensions = Dimension.create([{:nombre => "Gestion de Demanda"}, {:nombre => "Operacion"}])

perspectivas = Perspectiva.create([
  {:nombre => "Mercado", :dimension_id => dimensions[0].id},
  {:nombre => "Ventas", :dimension_id => dimensions[0].id},
  {:nombre => "Desarollo de Portafolio", :dimension_id => dimensions[0].id},])
  
indicadores = Indicador.create([
  {:nombre => "Target", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Cobertura de mercado", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Penetracion de mercado", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Indice de portafolio", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Indice de Oportunidad", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Rentabilidad de canal", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Cobertura de mercado", :perspectiva_id => perspectivas[0].id},
  {:nombre => "Oportunidad de Ventas", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Ciclo de Ventas", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Cierre de Ventas", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Precio de Venta", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Costo de Venta", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Predictivilidad", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Retencion de Cliente", :perspectiva_id => perspectivas[1].id},
  {:nombre => "Nuevos productos", :perspectiva_id => perspectivas[2].id},
  {:nombre => "Funcionalidad", :perspectiva_id => perspectivas[2].id},
  {:nombre => "Tiempo de llegada al mercado", :perspectiva_id => perspectivas[2].id},
  {:nombre => "Investigacion y desarrollo", :perspectiva_id => perspectivas[2].id},
])

fechas = Fecha.create([
  {:mes =>1, :anho => 2011},
  {:mes =>2, :anho => 2011},
  {:mes =>3, :anho => 2011},
  {:mes =>4, :anho => 2011},
  {:mes =>5, :anho => 2011},
  {:mes =>6, :anho => 2011},
  {:mes =>7, :anho => 2011},
  {:mes =>8, :anho => 2011},
  {:mes =>9, :anho => 2011},
  {:mes =>10, :anho => 2011},
  {:mes =>11, :anho => 2011},
  {:mes =>12, :anho => 2011},
])

mediciones = Medicion.create([
  {:valor => 45, :indicador_id => 1, :fecha_id => 1},
  {:valor => 95, :indicador_id => 1, :fecha_id => 2},
  {:valor => 75, :indicador_id => 1, :fecha_id => 3},
  {:valor => 14.25, :indicador_id => 1, :fecha_id => 4},
  {:valor => 79.12, :indicador_id => 1, :fecha_id => 5},
  {:valor => 73, :indicador_id => 1, :fecha_id => 6},
  {:valor => 46, :indicador_id => 1, :fecha_id => 7},
  {:valor => 97.32, :indicador_id => 1, :fecha_id => 8},
  {:valor => 47.14, :indicador_id => 1, :fecha_id => 9},
  {:valor => 33, :indicador_id => 1, :fecha_id => 10},
  {:valor => 67, :indicador_id => 1, :fecha_id => 11},
  {:valor => 58.2, :indicador_id => 1, :fecha_id => 12},
  {:valor => 14, :indicador_id => 2, :fecha_id => 1},
  {:valor => 65, :indicador_id => 2, :fecha_id => 2},
  {:valor => 14, :indicador_id => 2, :fecha_id => 3},
  {:valor => 34.25, :indicador_id => 2, :fecha_id => 4},
  {:valor => 59.12, :indicador_id => 2, :fecha_id => 5},
  {:valor => 63, :indicador_id => 2, :fecha_id => 6},
  {:valor => 26, :indicador_id => 2, :fecha_id => 7},
  {:valor => 37.32, :indicador_id => 2, :fecha_id => 8},
  {:valor => 57.14, :indicador_id => 2, :fecha_id => 9},
  {:valor => 63, :indicador_id => 2, :fecha_id => 10},
  {:valor => 77, :indicador_id => 2, :fecha_id => 11},
  {:valor => 18.2, :indicador_id => 2, :fecha_id => 12},
])
