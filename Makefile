up:
	mkdir -p /home/osboxes/data/mariadb
	mkdir -p /home/osboxes/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

fclean:
	docker system prune -af
	rm -rf /home/asedoun/data/wordpress/*
	rm -rf /home/asedoun/data/mariadb/*