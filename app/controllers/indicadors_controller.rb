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
    data_table = GoogleVisualr::DataTable.new
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
    
      option = { :width => 600, :height => 240, :title => @indicadorazul.nombre + ' ' + @indicadorazul.nombre + ': Anho 2011', :hAxis => {:title => 'Mes'}, :titleTextStyle => {:color => '#FF0000'} }
      @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option) 
  end
end

#opts   = { width: 400, height: 240, title: 'Company Performance', hAxis: {title: 'Year', titleTextStyle: {color: '#FF0000'}} }
