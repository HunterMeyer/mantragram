Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.max_attempts = 10
Delayed::Worker.delay_jobs = !Rails.env.include?('development'||'test')
