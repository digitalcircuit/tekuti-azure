include config.mk

SRC := tekuti/base64.scm tekuti/boot.scm tekuti/cache.scm          \
       tekuti/comment.scm tekuti/config.scm tekuti/filters.scm     \
       tekuti/git.scm tekuti/index.scm tekuti/match-bind.scm       \
       tekuti/mod-lisp.scm tekuti/page-helpers.scm tekuti/page.scm \
       tekuti/post.scm tekuti/request.scm tekuti/tags.scm          \
       tekuti/template.scm tekuti/util.scm tekuti/web.scm

OBJ := $(SRC:.scm=.go)



%.go: %.scm
	$(GUILD) compile -L. $(GUILE_WARNINGS) -o "$@" "$<"

all: $(OBJ)

.PHONY: clean
clean:
	rm -f $(OBJ)

install: all
	install -m755 -d $(INSTALL_SITE)/tekuti
	install -m644 -D $(OBJ) $(INSTALL_SITE)/tekuti
	install -m755 -D src/tekuti $(INSTALL_BIN)
