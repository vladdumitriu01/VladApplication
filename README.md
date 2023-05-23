# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

Rails 7.0.3
Ruby 3.1.3

* Database creation

Just run bundle install (if needed)
rails db:migrate
and then rails server

To upload all the votes please run the rake task found in lib/tasks/import_votes.rake by typing rake import:votes

To visualise all the campaigns go to localhost:3000/campaigns click on any and see all the details 


This application can be improved in loads of places:
- Add unit tests for the controller/rake tasks/service/everything else
- Add fail points in case anything fails, or anything does not get recorded properly (such as: Campaign cannot be found by name, in the service there are many edge cases that are not covered, such as time_of_vote/validity/campaign_name not being checked if nil)
- Instead of adding votes by a rake task and waiting to completion, instead add it a job for a worker doing it async
- Uploading large datasets can lead to many issues such as performance and memory, instead I would suggest for every file like this one instead storing it into a cloud service such as S3 and computing it when needed, instead of creating objects for it, or having a no-sql database and accessing the data from there
