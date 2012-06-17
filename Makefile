deploy:
	rvm 1.9.3@republica
	git pull
	git branch -l temp 
	
	cp ../deploy/republica2pay/production.rb config/environments/ 
	echo "\ngem 'heroku'\nruby '1.9.3'" >> Gemfile
	bundle install
	git add .
	git commit -m 'deploy'

	git push heroku master
	heroku run rake db:migrate
	git reset --hard temp
	git branch -D temp