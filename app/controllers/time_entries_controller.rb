class TimeEntriesController < ApplicationController
  # GET /time_entries
  # GET /time_entries.json
  def index
    @time_entries = TimeEntry.all
    #@supervisors = Member.where(supervisor: true)
    #@member = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @time_entries }
    end
  end

  # GET /time_entries/1
  # GET /time_entries/1.json
  def show
    @time_entry = TimeEntry.find(params[:id])
    @coop_id = @time_entry.coop_id
    @member = Member.where(coop_id: @coop_id)[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @time_entry }
    end
  end

  # GET /time_entries/report
  # GET /time_entries/reort.json
  def report

    @startD = params[:startDate]
    @endD = params[:endDate]
    @member = Member.all
    @time_entries = TimeEntry.all
    @report = MemberMonthReport.find(:all, :conditions => ['updated_at >= ? and updated_at <= ?',
    @startD, @endD])


    respond_to do |format|
      format.html # report.html.erb
      format.json { render json: @time_entries }
    end
  end

  # GET /time_entries/new
  # GET /time_entries/new.json
  def new
    @time_entry = TimeEntry.new
    #@supervisors = Member.where(supervisor: true)
    @members = Member.find(:all, :order => 'last_name ASC')

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
    @member = Member.where(coop_id: @time_entry.coop_id)[0]

    # add to member_month_report
    @thisYear = Time.now.utc.strftime("%Y")
    @thisMonth = Time.now.utc.strftime("%m")

    @report = MemberMonthReport.find_or_create_by_member_id_and_year_and_month(:member_id => @time_entry.coop_id, :year => @thisYear, :month => @thisMonth)

    @totalHours = (@report.shifts_worked*2.75 + @time_entry.hours_worked + @report.carryover_hours)
    @report.carryover_hours = @totalHours.remainder(2.75)
    @report.shifts_worked = (@totalHours-@report.carryover_hours)/2.75
    @report.save

    @member.carryover_hours = @report.carryover_hours
    @member.current_hours = @report.shifts_worked*2.75


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
    @time_entry.destroy

    respond_to do |format|
      format.html { redirect_to time_entries_url }
      format.json { head :no_content }
    end
  end
end
