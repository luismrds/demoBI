class MedicionsController < ApplicationController
  # GET /medicions
  # GET /medicions.xml
  def index
    @medicions = Medicion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medicions }
    end
  end

  # GET /medicions/1
  # GET /medicions/1.xml
  def show
    @medicion = Medicion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medicion }
    end
  end

  # GET /medicions/new
  # GET /medicions/new.xml
  def new
    @medicion = Medicion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medicion }
    end
  end

  # GET /medicions/1/edit
  def edit
    @medicion = Medicion.find(params[:id])
  end

  # POST /medicions
  # POST /medicions.xml
  def create
    @medicion = Medicion.new(params[:medicion])

    respond_to do |format|
      if @medicion.save
        format.html { redirect_to(@medicion, :notice => 'Medicion was successfully created.') }
        format.xml  { render :xml => @medicion, :status => :created, :location => @medicion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medicion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medicions/1
  # PUT /medicions/1.xml
  def update
    @medicion = Medicion.find(params[:id])

    respond_to do |format|
      if @medicion.update_attributes(params[:medicion])
        format.html { redirect_to(@medicion, :notice => 'Medicion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medicion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medicions/1
  # DELETE /medicions/1.xml
  def destroy
    @medicion = Medicion.find(params[:id])
    @medicion.destroy

    respond_to do |format|
      format.html { redirect_to(medicions_url) }
      format.xml  { head :ok }
    end
  end
end
