.POSIX:
EMACS = emacs
DOC  = README.org
FILE = init.el
EMACSD = local.el

DEBUG_FLAGS = --quick --load=${EMACSD} --load=init.el --directory=langs --directory=init --file=${FILE} --debug-init
RUN_FLAGS = --load=${EMACSD}
BATCH = --batch

EL   =  langs/elixir.el langs/solidity.el langs/json.el langs/html.el langs/pine.el langs/go.el langs/asm.el \
		langs/all.el langs/emacs-lisp.el langs/ruby.el langs/yaml.el langs/python-lang.el langs/shell.el \
		langs/rust.el langs/configs.el langs/orgmode.el langs/vyper.el langs/sage.el lisp/evil-unimpaired.el \
		init.el git.el blank.el trees.el init/langs.el init/vanilla.el

SEXP = "(message (emacs-version))"

all: run

compile: $(EL:.el=.elc)

lint:
	$(EMACS) $(DEBUG_FLAGS) ${BATCH} --eval="(elint-directory \".\")"

checkdoc:
	$(EMACS) $(DEBUG_FLAGS) ${BATCH} --eval="(checkdoc)"

version:
	$(EMACS) $(DEBUG_FLAGS) ${BATCH} --eval=${SEXP}

test:
	@echo "Testing Emacs configuration..."
	@$(EMACS) $(DEBUG_FLAGS) ${BATCH} --eval="(message \"==> TEST: Configuration loaded successfully!\")" 2>&1 | tee /tmp/emacs-test.log; \
	EXIT_CODE=$${PIPESTATUS[0]}; \
	echo ""; \
	echo "==> Test Results:"; \
	echo ""; \
	if [ $$EXIT_CODE -ne 0 ]; then \
		echo "FAIL: Emacs failed to start (exit code: $$EXIT_CODE)"; \
		exit 1; \
	fi; \
	ERRORS=$$(grep -E "^Error \(|^.*: Error:|failed" /tmp/emacs-test.log || true); \
	if [ -n "$$ERRORS" ]; then \
		echo "FAIL: Configuration loaded but errors were reported:"; \
		echo "$$ERRORS"; \
		echo ""; \
		exit 1; \
	else \
		echo "PASS: Emacs configuration loaded successfully without errors"; \
	fi; \
	rm -f /tmp/emacs-test.log

debug:
	$(EMACS) ${DEBUG_FLAGS} --eval=${SEXP}

run:
	$(EMACS) ${RUN_FLAGS} --eval=${SEXP}

clean:
	rm -f *.elc init/*.elc langs/*.elc lisp/*.elc

purge:
	rm -rf elpa/*

.SUFFIXES: .el .elc
.el.elc:
	$(EMACS) $(DEBUG_FLAGS) --funcall=batch-byte-compile $<
