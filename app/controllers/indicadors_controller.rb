class IndicadorsController < ApplicationController
  # GET /indicadors
  # GET /indicadors.xml
  def index
    @indicadors = Indicador.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @indicadors }
    end
  end

  # GET /indicadors/1
  # GET /indicadors/1.xml
  def show
    @indicador = Indicador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @indicador }
    end
  end

  # GET /indicadors/new
  # GET /indicadors/new.xml
  def new
    @indicador = Indicador.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @indicador }
    end
  end

  # GET /indicadors/1/edit
  def edit
    @indicador = Indicador.find(params[:id])
  end

  # POST /indicadors
  # POST /indicadors.xml
  def create
    @indicador = Indicador.new(params[:indicador])

    respond_to do |format|
      if @indicador.save
        format.html { redirect_to(@indicador, :notice => 'Indicador was successfully created.') }
        format.xml  { render :xml => @indicador, :status => :created, :location => @indicador }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @indicador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /indicadors/1
  # PUT /indicadors/1.xml
  def update
    @indicador = Indicador.find(params[:id])

    respond_to do |format|
      if @indicador.update_attributes(params[:indicador])
        format.html { redirect_to(@indicador, :notice => 'Indicador was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @indicador.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadors/1
  # DELETE /indicadors/1.xml
  def destroy
    @indicador = Indicador.find(params[:id])
    @indicador.destroy

    respond_to do |format|
      format.html { redirect_to(indicadors_url) }
      format.xml  { head :ok }
    end
  end
  
  def pvisualizar
    @indicador = Indicador.find(params[:id])
    mediciones = Medicion.where(" indicador_id = ? ", @indicador.id )
    combo = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Mes')
    data_table.new_column('number', @indicador.nombre)
    data_table.add_rows([
      ['1', mediciones[0].valor],
      ['2', mediciones[1].valor],
      ['3', mediciones[2].valor],
      ['4', mediciones[3].valor],
      ['5', mediciones[4].valor],
      ['6', mediciones[5].valor],
      ['7', mediciones[6].valor],
      ['8', mediciones[7].valor],
      ['9', mediciones[8].valor],
      ['10', mediciones[9].valor],
      ['11', mediciones[10].valor],
      ['12', mediciones[11].valor]
    ])
    
      option = { :width => 600, :height => 240, :title => @indicador.nombre + ' Anho 2011', :hAxis => {:title => 'Mes'}, :titleTextStyle => {:color => '#FF0000'} }
      @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option) 
  end
  
  def pversus
    @indicadores = Indicador.all.order('nombre')
  end
  
  def versus
    @indicadorrojo = Indicador.find(params[:idr])
    @indicadorazul = Indicador.find(params[:ida])
    medicionesr = Medicion.where(" indicador_id = ? ", @indicadorrojo.id )
    medicionesa = Medicion.where(" indicador_id = ? ", @indicadorazul.id )
    
    data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Mes')
    data_table.new_column('number', @indicadorrojo.nombre)
    data_table.new_column('number', @indicadorazul.nombre)
    data_table.add_rows([
      ['1', medicionesr[0].valor, medicionesa[0].valor],
      ['2', medicionesr[1].valor, medicionesa[1].valor],
      ['3', medicionesr[2].valor, medicionesa[2].valor],
      ['4', medicionesr[3].valor, medicionesa[3].valor],
      ['5', medicionesr[4].valor, medicionesa[4].valor],
      ['6', medicionesr[5].valor, medicionesa[5].valor],
      ['7', medicionesr[6].valor, medicionesa[6].valor],
      ['8', medicionesr[7].valor, medicionesa[7].valor],
      ['9', medicionesr[8].valor, medicionesa[8].valor],
      ['10', medicionesr[9].valor, medicionesa[9].valor],
      ['11', medicionesr[10].valor, medicionesa[10].valor],
      ['12', medicionesr[11].valor, medicionesa[11].valor]
    ])
    
      option = { :width => 600, :height => 240, :title => @indicadorrojo.nombre + ' vs ' + @indicadorazul.nombre + ': Anho 2011', :hAxis => {:title => 'Mes'}, :titleTextStyle => {:color => '#FF0000'} }
      @lineas = GoogleVisualr::Interactive::AreaChart.new(data_table, option) 
      
     tablabarras = GoogleVisualr::DataTable.new
      tablabarras.new_column('string', 'Year')
      tablabarras.new_column('number', @indicadorrojo.nombre)
      tablabarras.new_column('number', @indicadorazul.nombre)
      tablabarras.add_rows(4)
      tablabarras.set_cell(0, 0, 'Enero')
      tablabarras.set_cell(0, 1, medicionesa[0].valor)
      tablabarras.set_cell(0, 2, medicionesr[0].valor)
      tablabarras.set_cell(1, 0, 'Febrero')
      tablabarras.set_cell(1, 1, medicionesa[1].valor)
      tablabarras.set_cell(1, 2, medicionesr[1].valor)
      tablabarras.set_cell(2, 0, 'Marzo')
      tablabarras.set_cell(2, 1, medicionesa[2].valor)
      tablabarras.set_cell(2, 2, medicionesr[2].valor)
      tablabarras.set_cell(3, 0, 'Abril')
      tablabarras.set_cell(3, 1, medicionesa[3].valor)
      tablabarras.set_cell(3, 2, medicionesr[3].valor)
    
      opts = { :width => 400, :height => 240, :title => @indicadorrojo.nombre + ' vs ' + @indicadorazul.nombre + ': Anho 2011', :hAxis => { :title => 'Year', :titleTextStyle => {:color => 'red'}} }
      @barras = GoogleVisualr::Interactive::ColumnChart.new(tablabarras, opts) 
      
      
       combo = GoogleVisualr::DataTable.new
  combo.new_column('string', 'month' )
  combo.new_column('number', @indicadorrojo.nombre )
  combo.new_column('number', @indicadorazul.nombre )
  combo.new_column('number', 'Diferencia' )
  combo.add_rows( [
    ['1', medicionesa[0].valor, medicionesr[0].valor,  (medicionesr[0].valor - medicionesa[0].valor).abs],
    ['2', medicionesa[1].valor, medicionesr[1].valor,  (medicionesa[1].valor - medicionesr[1].valor).abs],
    ['3', medicionesa[2].valor, medicionesr[2].valor,  (medicionesa[2].valor - medicionesr[2].valor).abs],
    ['4', medicionesa[3].valor, medicionesr[3].valor,  (medicionesa[3].valor - medicionesr[3].valor).abs],
    ['5', medicionesa[4].valor, medicionesr[4].valor,  (medicionesa[4].valor - medicionesr[4].valor).abs]
  ] )
  
  opts = { :width => 700, :height => 400, :title => @indicadorrojo.nombre + ' vs ' + @indicadorazul.nombre + ': Anho 2011', :vAxis => {:title => 'Unidad'}, :hAxis => {:title => 'Month'}, :seriesType => 'bars', :series => {'2' => {:type => 'line'}} }
  @combo = GoogleVisualr::Interactive::ComboChart.new(combo, opts)
  
  tablamedidor = GoogleVisualr::DataTable.new
  tablamedidor.new_column('string' , 'Label')
  tablamedidor.new_column('number' , 'Value')
  tablamedidor.add_rows(3)
  tablamedidor.set_cell(0, 0, @indicadorrojo.nombre )
  tablamedidor.set_cell(0, 1, 80)
  tablamedidor.set_cell(1, 0, 'Cobertura' )
  tablamedidor.set_cell(1, 1, 55)

  opts = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
  @medidor = GoogleVisualr::Interactive::Gauge.new(tablamedidor, opts)

  
  end
end

#opts   = { width: 400, height: 240, title: 'Company Performance', hAxis: {title: 'Year', titleTextStyle: {color: '#FF0000'}} }
