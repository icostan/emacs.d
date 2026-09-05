.POSIX:
EMACS = emacs
DOC  = README.org
FILE = init.el
EMACSD = local.el

DEBUG_FLAGS = --quick --load=${EMACSD} --load=init.el --directory=langs --directory=init --debug-init
RUN_FLAGS = --load=${EMACSD}
BATCH = --batch

EL = blank.el home.el init.el local.el files/hello.el \
	init/ai.el init/compiling.el init/completion-company.el init/completion-corfu.el \
	init/diagrams.el init/editing.el init/files-essentials.el init/git.el init/helper.el \
	init/keybindings-general.el init/langs.el init/lsp-eglot.el init/lsp-lsp.el init/math.el \
	init/misc.el init/navigation.el init/personal-finance.el init/presentation.el \
	init/project-management.el init/replacing.el init/searching.el init/selection-ivy.el \
	init/selection-vertico.el init/snippets.el init/spelling.el init/startup.el \
	init/syntax-flycheck.el init/syntax-flymake.el init/themes.el init/trees.el init/ui.el \
	init/vanilla.el init/vim.el init/windows.el \
	langs/all.el langs/asm.el langs/c.el langs/configs.el langs/css.el langs/dart.el \
	langs/elixir.el langs/emacs-lisp.el langs/erlang.el langs/go.el langs/html.el \
	langs/javascript.el langs/json.el langs/orgmode.el langs/pine.el langs/python-lang.el \
	langs/ruby.el langs/rust.el langs/sage.el langs/shell.el langs/solidity.el \
	langs/terraform.el langs/vyper.el langs/yaml.el \
	lisp/evil-unimpaired.el lisp/gptel-proof.el lisp/ob-ledger.el

SEXP = "(message (emacs-version))"

all: run

compile:
	$(EMACS) $(DEBUG_FLAGS) ${BATCH} --funcall=batch-byte-compile $(EL)

lint:
	$(EMACS) $(DEBUG_FLAGS) ${BATCH} --eval="(require 'elint)" --eval="(elint-directory \".\")"

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
	rm -f *.elc init/*.elc langs/*.elc lisp/*.elc files/*.elc

purge:
	rm -rf elpa/*

.SUFFIXES:
