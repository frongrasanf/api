class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy]

  # GET /schedules
  def index
    if params[:date]
      date = params[:date]
      @schedules = Schedule.where(start_at: date.in_time_zone.all_month).order("start_at ASC")
    else
      date = Time.zone.now.strftime("%Y-%m-%d")
      @schedules = Schedule.where(start_at: date.in_time_zone.all_month).order("start_at ASC")
    end

    render json: @schedules
  end

  # GET /schedules/1
  def show
    render json: @schedule
  end

  # POST /schedules
  def create
    @schedule = Schedule.new
    @schedule.title = params[:title]
    time_array = params[:start_at].split("-")
    p time_array
    @schedule.start_at = DateTime.new(time_array[0].to_i, time_array[1].to_i, time_array[2].to_i, 00, 00, 00)

    if @schedule.save
      @schedules = Schedule.where(start_at: @schedule.start_at.in_time_zone.all_month).order("start_at ASC")
      p @schedules
      render json: @schedules, status: :created
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      render json: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    start_at = @schedule.start_at
    @schedules = Schedule.where(start_at: start_at.all_month)
    @schedule.destroy
    render json: @schedules

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(:title)
    end
end
