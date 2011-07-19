class FechasController < ApplicationController
  # GET /fechas
  # GET /fechas.xml
  def index
    @fechas = Fecha.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fechas }
    end
  end

  # GET /fechas/1
  # GET /fechas/1.xml
  def show
    @fecha = Fecha.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fecha }
    end
  end

  # GET /fechas/new
  # GET /fechas/new.xml
  def new
    @fecha = Fecha.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fecha }
    end
  end

  # GET /fechas/1/edit
  def edit
    @fecha = Fecha.find(params[:id])
  end

  # POST /fechas
  # POST /fechas.xml
  def create
    @fecha = Fecha.new(params[:fecha])

    respond_to do |format|
      if @fecha.save
        format.html { redirect_to(@fecha, :notice => 'Fecha was successfully created.') }
        format.xml  { render :xml => @fecha, :status => :created, :location => @fecha }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fecha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fechas/1
  # PUT /fechas/1.xml
  def update
    @fecha = Fecha.find(params[:id])

    respond_to do |format|
      if @fecha.update_attributes(params[:fecha])
        format.html { redirect_to(@fecha, :notice => 'Fecha was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fecha.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fechas/1
  # DELETE /fechas/1.xml
  def destroy
    @fecha = Fecha.find(params[:id])
    @fecha.destroy

    respond_to do |format|
      format.html { redirect_to(fechas_url) }
      format.xml  { head :ok }
    end
  end
end
