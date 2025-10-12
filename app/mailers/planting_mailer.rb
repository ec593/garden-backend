class PlantingMailer < ApplicationMailer
    default from: 'no-reply@example.com'

    def planting_reminder(planting_ids)
        @plantings = Planting.where(id: planting_ids)
        mail(to: 'erin.cyffka@gmail.com', subject: 'This week\'s planting tasks!')
    end
end

# sudo systemctl start redis
# bundle exec sidekiq -C config/sidekiq.yml

# to test: rails -c, WeeklyPlantingEmailJob.perform_now
