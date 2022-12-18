.PHONY: bootstrap
bootstrap:
	yarn install --pure-lockfiles
	yarn build
	"${MAKE}" migrate
	echo "dotenv .env.local" > .envrc && direnv allow .

.PHONY: migrate
migrate:
	. .env.local \
		&& npm run migrate:dev \
		&& npm run seed

.PHONY: run
run:
	npm run dev
