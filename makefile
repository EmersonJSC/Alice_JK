#command = env LANG=\"pt_BR.UTF-8\" /usr/bin/bundle exec /usr/local/bin/jekyll build --incremental --trace --destination=/var/www/html/alice_cast --source=/var/www/src/Alice_JK 2>&1
#command = script/script.sh && /usr/bin/bundle exec /usr/local/bin/jekyll build --trace --destination=/var/www/html/alice_cast --source=/var/www/src/Alice_JK 2>&1

JEKYLL_CMD = bundle exec jekyll

SRC_PATH = /var/www/src/Alice_JK
DEST_PATH = /var/www/html/alice_cast
LOG_PATH = /tmp/alicecast-jekyll.log

DEST_DIR_FLAGS = --destination=${DEST_PATH}
SRC_DIR_FLAGS = --source=${SRC_PATH}

BUILD_FLAGS = --trace --incremental
SERVE_FLAGS = -H 0.0.0.0 -P 33002

all:
	sg www-data -c "${JEKYLL_CMD} build ${BUILD_FLAGS} ${SRC_DIR_FLAGS} ${DEST_DIR_FLAGS}"

# Executa o build toda vez que muda um arquivo
# Rodando como serviço do systemd em /etc/systemd/system/alicecast-build-watch.service
# examplo: sg www-data -c 'make watch'
watch:
	${JEKYLL_CMD} build {BUILD_FLAGS} ${DEST_DIR_FLAGS} ${SRC_DIR_FLAGS} -w

serve:
	${JEKYLL_CMD} serve ${SRC_DIR_FLAGS} ${SERVE_FLAGS}

clean:
	rm -rf ${DEST_PATH}/*
