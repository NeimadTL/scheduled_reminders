module ReminderOwnerFilter

  def require_to_be_reminder_owner
    unless current_user.id == @reminder.user_id
      flash[:alert] = "You are not the owner of this reminder"
      redirect_to root_path
    end
  end

end
