HEROKU_API_TOKEN := ${HEROKU_API_TOKEN}
HEROKU_APP_NAME  := ${HEROKU_APP_NAME}

deploy:
	git push https://heroku:${HEROKU_API_TOKEN}@git.heroku.com/${HEROKU_APP_NAME}.git origin/master:master -f

.PHONY: deploy
