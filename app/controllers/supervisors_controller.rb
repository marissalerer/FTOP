class SupervisorsController < ApplicationController
  # GET /supervisors
  # GET /supervisors.json
  def index
    @supervisors = Supervisor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supervisors }
    end
  end

  # GET /supervisors/1
  # GET /supervisors/1.json
  def show
    @supervisor = Supervisor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supervisor }
    end
  end

  # GET /supervisors/new
  # GET /supervisors/new.json
  def new
    @supervisor = Supervisor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supervisor }
    end
  end

  # GET /supervisors/1/edit
  def edit
    @supervisor = Supervisor.find(params[:id])
  end

  # POST /supervisors
  # POST /supervisors.json
  def create
    @supervisor = Supervisor.new(params[:supervisor])

    respond_to do |format|
      if @supervisor.save
        format.html { redirect_to @supervisor, notice: 'Supervisor was successfully created.' }
        format.json { render json: @supervisor, status: :created, location: @supervisor }
      else
        format.html { render action: "new" }
        format.json { render json: @supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supervisors/1
  # PUT /supervisors/1.json
  def update
    @supervisor = Supervisor.find(params[:id])

    respond_to do |format|
      if @supervisor.update_attributes(params[:supervisor])
        format.html { redirect_to @supervisor, notice: 'Supervisor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supervisor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supervisors/1
  # DELETE /supervisors/1.json
  def destroy
    @supervisor = Supervisor.find(params[:id])
    @supervisor.destroy

    respond_to do |format|
      format.html { redirect_to supervisors_url }
      format.json { head :no_content }
    end
  end
end
