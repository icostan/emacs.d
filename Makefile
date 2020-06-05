.POSIX:
EMACS = emacs
EMACSFLAGS = --batch --quick --load=init.el --directory=langs --file=init.el --debug-init

EL   = langs/asm.el langs/emacs-lisp.el langs/go.el langs/pine.el langs/python-lang.el langs/ruby.el \
		langs/html.el langs/orgmode.el langs/yaml.el \
		init.el
DOC  = README.org

all: run

compile: $(EL:.el=.elc)

lint:
	$(EMACS) $(EMACSFLAGS) --eval="(elint-directory \".\")"

checkdoc:
	$(EMACS) $(EMACSFLAGS) --eval="(checkdoc)"

check: compile
	$(EMACS) $(EMACSFLAGS) --eval="(message (emacs-version))"

run: compile
	$(EMACS) -q -l init.el init.el

clean:
	rm -f init.elc langs/*.elc langs/*.elc

.SUFFIXES: .el .elc
.el.elc:
	$(EMACS) $(EMACSFLAGS) --funcall=batch-byte-compile $<
