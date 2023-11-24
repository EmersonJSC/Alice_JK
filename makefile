command = env LANG=\"pt_BR.UTF-8\" /usr/bin/bundle exec /usr/local/bin/jekyll build --incremental --trace --destination=/var/www/html/alice_cast --source=/var/www/src/Alice_JK 2>&1

all:
#	/usr/bin/sg www-data -c "$(command)"
	$(command)

reboot:
	rm -rf /var/www/html/alice_cast/*
	$(command)
