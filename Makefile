.POSIX:
EMACS = emacs
DOC  = README.org
FILE = init.el
EMACSD = local.el

EMACSFLAGS = --quick --load=${EMACSD} --load=init.el --directory=langs --directory=init --file=${FILE} --debug-init
BATCH = --batch

EL   =  langs/elixir.el langs/solidity.el langs/json.el langs/html.el langs/pine.el langs/go.el langs/asm.el \
		langs/all.el langs/emacs-lisp.el langs/ruby.el langs/yaml.el langs/python-lang.el langs/shell.el \
		langs/rust.el langs/configs.el langs/orgmode.el langs/vyper.el langs/sage.el lisp/evil-unimpaired.el \
		init.el git.el blank.el trees.el init/langs.el init/vanilla.el

SEXP = "(message (emacs-version))"

all: run

compile: $(EL:.el=.elc)

lint:
	$(EMACS) $(EMACSFLAGS) ${BATCH} --eval="(elint-directory \".\")"

checkdoc:
	$(EMACS) $(EMACSFLAGS) ${BATCH} --eval="(checkdoc)"

version:
	$(EMACS) $(EMACSFLAGS) ${BATCH} --eval=${SEXP}

run:
	$(EMACS) ${EMACSFLAGS} --eval=${SEXP}

clean:
	rm -f *.elc init/*.elc langs/*.elc lisp/*.elc

purge:
	rm -rf elpa/*

.SUFFIXES: .el .elc
.el.elc:
	$(EMACS) $(EMACSFLAGS) --funcall=batch-byte-compile $<
