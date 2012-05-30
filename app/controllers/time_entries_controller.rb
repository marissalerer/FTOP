class TimeEntriesController < ApplicationController
  # GET /time_entries
  # GET /time_entries.json
  def index
    @time_entries = TimeEntry.all
    @supervisors = Member.where(supervisor: true)
    @member = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_entries }
    end
  end

  # GET /time_entries/1
  # GET /time_entries/1.json
  def show
    @time_entry = TimeEntry.find(params[:id])
    @supervisors = Member.where(supervisor: true)
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_entry }
    end
  end

  # GET /time_entries/report
  # GET /time_entries/reort.json
  def report
    @time_entries = TimeEntry.all
    @member = Member.all
    @timecards = Member.joins(:time_entries)
    # @hours = TimeEntry.where(coop_id: Member.coop_id).hours_worked
    # select fname, users_id, sum(hours_worked) as total_hours, floor(sum(hours_worked)/2.75) as shifts, (sum(hours_worked)/2.75 - floor(sum(hours_worked)/2.75)) * 2.75 as carry_over_hours from time_entries left join users on time_entries.users_id=users.id where created_at between '2012-03-01' and '2012-05-01' group by users_id
    respond_to do |format|
      format.html # report.html.erb
      format.json { render json: @time_entries }
    end
  end

  # GET /time_entries/new
  # GET /time_entries/new.json
  def new
    @time_entry = TimeEntry.new
    @supervisors = Member.where(supervisor: true)
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @time_entry }
    end
  end

  # GET /time_entries/1/edit
  def edit
    @time_entry = TimeEntry.find(params[:id])
  end

  # POST /time_entries
  # POST /time_entries.json
  def create
    @time_entry = TimeEntry.new(params[:time_entry])
    @supervisors = Member.where(supervisor: true)
    # @member = Member.find(params[:coop_id])

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to @time_entry, notice: 'Time entry was successfully created.' }
        format.json { render json: @time_entry, status: :created, location: @time_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /time_entries/1
  # PUT /time_entries/1.json
  def update
    @time_entry = TimeEntry.find(params[:id])
    @supervisors = Member.where(supervisor: true)

    respond_to do |format|
      if @time_entry.update_attributes(params[:time_entry])
        format.html { redirect_to @time_entry, notice: 'Time entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @time_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.json
  def destroy
    @time_entry = TimeEntry.find(params[:id])
    @supervisors = Member.where(supervisor: true)
    @time_entry.destroy

    respond_to do |format|
      format.html { redirect_to time_entries_url }
      format.json { head :no_content }
    end
  end
end
