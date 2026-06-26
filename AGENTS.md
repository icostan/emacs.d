# Repository Guidelines

## Project Structure & Module Organization

This repository is a modular Emacs configuration. `init.el` initializes package managers, then loads feature modules from `init/` and language modules through `init/langs.el`. Put functional configuration in `init/` (for example `init/git.el`, `init/ai.el`) and language-specific setup in `langs/` (for example `langs/elixir.el`, `langs/rust.el`). Custom local packages live in `lisp/`. Example fixtures live in `files/`; snippets live under `snippets/`. Do not edit generated `.elc` files or vendored package directories such as `elpa/` and `straight/`.

## Build, Test, and Development Commands

- `make run` starts Emacs using `local.el`, isolating this checkout as `user-emacs-directory`.
- `make run EMACSD=home.el` starts Emacs against the normal home configuration.
- `make test` loads the configuration in batch mode and fails on startup errors.
- `make compile` byte-compiles the configured Emacs Lisp files.
- `make lint` runs `elint-directory` over the repository.
- `make checkdoc` runs Emacs checkdoc.
- `make clean` removes compiled `.elc` files.

Use `make version` to verify the Emacs version.

## Coding Style & Naming Conventions

Write Emacs Lisp with lexical binding where appropriate and follow the existing header pattern: `;;; name.el --- Summary`, `;;; Commentary:`, and `;;; Code:`. Prefer declarative `use-package` blocks with `:custom`, `:hook`, `:general`, and `:config` sections. Each module should end with `(provide 'module-name)` and the matching `;;; name.el ends here` footer. Keep module names lowercase and hyphenated. Project-specific functions use the `icostan/` prefix.

## Testing Guidelines

There is no separate unit test suite. The primary regression check is successful startup via `make test`; run it after module, package, or keybinding changes. For broader changes, also run `make compile` and `make lint`. When adding language support, verify the relevant file in `files/` or add a small sample fixture.

## Commit & Pull Request Guidelines

Recent commits use short imperative summaries, often scoped by feature: `Remove helm`, `Split syntax-checking`, `Add fix/fixion command`. Keep commits focused and describe user-visible config changes. Pull requests should include a concise description, affected modules, commands run, and any external dependencies such as language servers or environment variables. Include screenshots only for visible UI or theme changes.

## Agent-Specific Instructions

Keep changes minimal and targeted. Preserve existing package manager choices (`package.el`, `use-package`, `quelpa`, `straight.el`) and do not introduce a new manager. Avoid touching personal secrets or local-only settings; `init/git.el` reads `EMACS_LAB_TOKEN` from the environment.
