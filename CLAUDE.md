# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Emacs configuration repository structured as a modular, declarative setup using `use-package`. The configuration emphasizes:

- **Modular architecture**: Language-specific configs in `langs/`, functional modules in `init/`
- **Multiple package managers**: Built-in package.el, use-package (primary), quelpa, and straight.el
- **Literate programming**: Some configurations may have corresponding `.org` files
- **Evil mode**: Vim-style key bindings with leader keys under SPC
- **AI integration**: GPTel, Ollama, and Claude Code IDE support

## Architecture

### Initialization Flow

1. `init.el` - Entry point that sets up package managers and loads all modules
2. `local.el` or `home.el` - Environment selector (local project vs home directory)
3. Module loading via `use-package` declarations in `init.el`

### Package Manager Hierarchy

The configuration uses multiple package managers in this order:
1. **package.el** - Built-in ELPA/MELPA (initialized first in init.el:22-28)
2. **use-package** - Declarative package configuration (init.el:32-51)
3. **quelpa** - Git-based package builds (init.el:60-70)
4. **straight.el** - Alternative package manager (init.el:73-88)

### Directory Structure

- `init/` - Functional modules loaded via `use-package` in init.el:144-176
  - `lsp-eglot.el` - Language Server Protocol via Eglot
  - `ai.el` - AI integrations (GPTel, Ollama, Claude Code IDE)
  - `completion-corfu.el` - Code completion (active)
  - `selection-vertico.el` - Selection framework (active)
  - `vim.el` - Evil mode and vim emulation
  - `git.el` - Git integration with Magit
  - Plus ~25 other modules for themes, editing, navigation, etc.

- `langs/` - Programming language configurations loaded via init/langs.el
  - Each language has its own module (e.g., `elixir.el`, `python-lang.el`, `rust.el`)
  - Loaded through `init/langs.el` which imports all language modules

- `lisp/` - Custom Emacs Lisp packages
  - `evil-unimpaired.el` - Custom vim-style navigation bindings
  - `ob-ledger.el` - Org-babel support for ledger
  - `gptel-proof.el` - Custom GPTel integration (currently commented out)

## Development Commands

### Basic Operations

```bash
# Run isolated Emacs instance (project config only, default)
make run

# Run with home directory config
make run EMACSD=home.el

# Run with custom file
make run FILE=your-file.el

# Check Emacs version
make version
```

### Testing

```bash
# Test that Emacs configuration loads successfully
make test
```

### Code Quality

```bash
# Byte compile all files
make compile

# Lint Emacs Lisp code
make lint

# Run checkdoc on code
make checkdoc
```

### Cleanup

```bash
# Clean compiled .elc files
make clean

# Purge installed ELPA packages
make purge
```

## Key System Dependencies

### Language Servers (for Eglot)

The following language servers must be installed externally:
- `ccls` or `clangd` - C/C++
- `elixir-ls` - Elixir
- `cmake-language-server` - CMake
- `tailwindcss-language-server` - CSS/Tailwind

See init/lsp-eglot.el:18-23 for the complete list.

## Module Organization Patterns

### Use-Package Declaration Pattern

All modules follow this pattern:
1. Loaded via `use-package` with `:load-path "init"` or `:load-path "langs"`
2. Each module file ends with `(provide 'module-name)`
3. Modules use `:custom`, `:config`, `:hook`, `:general` (for keybindings)

### Language Configuration

Language modules in `langs/` typically configure:
- Major mode setup
- Syntax highlighting
- LSP/Eglot integration
- Language-specific keybindings
- REPL or interpreter integration

### Keybinding Architecture

- Evil mode provides vim-style normal/insert/visual states
- Leader keys mapped under SPC (space) using `general.el`
- AI commands mapped to SPC ; (gptel-send) and SPC ' (gptel-menu)
- Original Emacs keybindings preserved where possible

## Environment Configuration

Two environment files control initialization:
- `local.el` - Sets `user-emacs-directory` to `./` for isolated testing
- `home.el` - Uses default `~/.emacs.d` directory

Specify via `make run EMACSD=<file>` (defaults to `local.el`)

## Custom Subagents and Skills

### Fix Agent (Subagent)

A custom subagent that automatically fixes individual Emacs configuration errors:

**Location**: `.claude/agents/fix.md`

**Usage**:
```
Use the fix agent to fix this error: <error message>
```

**What it does**:
- Accepts error messages from `make test`, compilation, or runtime
- Diagnoses the root cause by searching the codebase
- Applies minimal fixes following codebase patterns
- Runs `make test` to verify the fix
- Iterates up to 3 times if needed
- Reports what was changed and why

**When to use**:
- Single error that needs fixing
- Test failures from `make test`
- Package installation errors
- Unrecognized keyword errors (`:vc`, `:straight`, etc.)
- Batch mode compatibility issues
- Syntax errors in Elisp files

### Fixion Skill (Automated Fix Loop)

A skill that orchestrates multiple fix attempts using the fix agent:

**Location**: `.claude/skills/fixion/SKILL.md`

**Usage**:
```
/fixion
```

**What it does**:
1. Runs `make test` to find all errors
2. For each error:
   - Spawns the fix subagent to fix it
   - Waits for completion
   - Verifies the fix with another test run
   - Advances to the next error
3. Provides a final summary of all fixes applied

**Features**:
- Handles multiple errors automatically
- Tracks which errors were fixed vs failed
- Maximum 10 iterations to prevent infinite loops
- Skips errors that fail twice in a row
- Provides detailed summary at the end

**When to use**:
- Multiple test failures that need fixing
- After major configuration changes
- When you want fully automated error resolution
- CI/CD integration for configuration validation

## Working with This Repository

When modifying configurations:
1. Edit the appropriate module in `init/` or `langs/`
2. New languages go in `langs/` and must be added to `init/langs.el`
3. Test with `make run` before committing
4. Check code quality with `make lint`
5. Use the fix agent for automatic error resolution
6. Module naming: use descriptive names matching their purpose (e.g., `syntax-flymake.el`, `completion-corfu.el`)

The configuration is designed to be self-contained and reproducible across environments.
