.POSIX:
EMACS = emacs
EMACSFLAGS = --batch --quick --load=init.el --directory=langs --directory=markups --file=init.el --debug-init

all: run

compile: init.elc

lint:
	$(EMACS) $(EMACSFLAGS) --eval="(elint-directory \".\")"

checkdoc:
	$(EMACS) $(EMACSFLAGS) --eval="(checkdoc)"

run: compile
	$(EMACS) $(EMACSFLAGS) --eval="(message (emacs-version))"

clean:
	rm -f init.elc

.SUFFIXES: .el .elc
.el.elc:
	$(EMACS) $(EMACSFLAGS) --funcall=batch-byte-compile $<
