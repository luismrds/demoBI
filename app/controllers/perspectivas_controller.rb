class PerspectivasController < ApplicationController
  # GET /perspectivas
  # GET /perspectivas.xml
  def index
    @perspectivas = Perspectiva.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @perspectivas }
    end
  end

  # GET /perspectivas/1
  # GET /perspectivas/1.xml
  def show
    @perspectiva = Perspectiva.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @perspectiva }
    end
  end

  # GET /perspectivas/new
  # GET /perspectivas/new.xml
  def new
    @perspectiva = Perspectiva.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @perspectiva }
    end
  end

  # GET /perspectivas/1/edit
  def edit
    @perspectiva = Perspectiva.find(params[:id])
  end

  # POST /perspectivas
  # POST /perspectivas.xml
  def create
    @perspectiva = Perspectiva.new(params[:perspectiva])

    respond_to do |format|
      if @perspectiva.save
        format.html { redirect_to(@perspectiva, :notice => 'Perspectiva was successfully created.') }
        format.xml  { render :xml => @perspectiva, :status => :created, :location => @perspectiva }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @perspectiva.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /perspectivas/1
  # PUT /perspectivas/1.xml
  def update
    @perspectiva = Perspectiva.find(params[:id])

    respond_to do |format|
      if @perspectiva.update_attributes(params[:perspectiva])
        format.html { redirect_to(@perspectiva, :notice => 'Perspectiva was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @perspectiva.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /perspectivas/1
  # DELETE /perspectivas/1.xml
  def destroy
    @perspectiva = Perspectiva.find(params[:id])
    @perspectiva.destroy

    respond_to do |format|
      format.html { redirect_to(perspectivas_url) }
      format.xml  { head :ok }
    end
  end
end
