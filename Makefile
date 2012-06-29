deploy:
	git pull
	git branch -l temps
	
	git pull git@heroku.com:republica2pay.git

	git push heroku master
	git reset --hard temps
	git branch -D temps
	
	heroku run rake db:migrate