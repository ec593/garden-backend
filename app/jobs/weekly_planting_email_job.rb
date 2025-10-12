class WeeklyPlantingEmailJob < ApplicationJob
  queue_as :default
  def perform
    start_date = Date.today
    end_date = start_date + 7.days
    upcoming_planting_ids = Planting.where(start: start_date..end_date).pluck(:id)
    PlantingMailer.planting_reminder(upcoming_planting_ids).deliver_later
  end
end
