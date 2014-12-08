
scaffold:
	# Your scaffold here

destroy:
	# Your destroy here

migrate:
	rake db:drop:all
	rake db:create
	rake db:migrate
	rake db:seed

redo: destroy scaffold migrate
	rails s
