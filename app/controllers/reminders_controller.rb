class RemindersController < ApplicationController
  include ReminderOwnerFilter
  before_action :authenticate_user!
  before_action :set_reminder, only: [:show, :edit, :update, :destroy]
  before_action :require_to_be_reminder_owner, only: [:show, :edit, :update, :destroy]

  # GET /reminders
  # GET /reminders.json
  def index
    @reminders = Reminder.where(user_id: current_user.id).order(created_at: :desc)
  end

  # GET /reminders/1
  # GET /reminders/1.json
  def show
  end

  # GET /reminders/new
  def new
    @reminder = Reminder.new
  end

  # GET /reminders/1/edit
  def edit
  end

  # POST /reminders
  # POST /reminders.json
  def create
    @reminder = Reminder.new(reminder_params.merge(user: current_user))

    respond_to do |format|
      if @reminder.save
        format.html { redirect_to @reminder, notice: 'Reminder was successfully created.' }
        format.json { render :show, status: :created, location: @reminder }
      else
        format.html { render :new }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reminders/1
  # PATCH/PUT /reminders/1.json
  def update
    respond_to do |format|
      if @reminder.update(reminder_params)
        format.html { redirect_to @reminder, notice: 'Reminder was successfully updated.' }
        format.json { render :show, status: :ok, location: @reminder }
      else
        format.html { render :edit }
        format.json { render json: @reminder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reminders/1
  # DELETE /reminders/1.json
  def destroy
    @reminder.destroy
    respond_to do |format|
      format.html { redirect_to reminders_url, notice: 'Reminder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reminder
      @reminder = Reminder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reminder_params
      params.require(:reminder).permit(:title, :description, :scheduled_at, :send_email_at)
    end
end
