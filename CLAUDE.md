# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Emacs configuration repository structured as a modular, declarative setup using `use-package`. The configuration emphasizes:

- **Modular architecture**: Language-specific configs in `langs/`, functional modules in `init/`
- **Package management**: Uses multiple package managers (straight.el, quelpa, use-package)
- **Literate programming**: Many configs are generated from org-mode files
- **Evil mode**: Vim-style key bindings integrated with Emacs
- **AI integration**: GPTel, Ollama, and Claude Code IDE support

## Architecture

### Core Files
- `init.el` - Main entry point that loads all modules
- `local.el` / `home.el` - Environment-specific configurations
- `Makefile` - Build and development commands

### Directory Structure
- `init/` - Functional modules (completion, LSP, git, themes, etc.)
- `langs/` - Programming language configurations
- `lisp/` - Custom Emacs Lisp packages
- `files/` - Sample files and test data
- `straight/`, `quelpa/`, `elpa/` - Package manager directories

### Key Modules
- `init/lsp-eglot.el` - Language Server Protocol via Eglot
- `init/ai.el` - AI integration (GPTel, Ollama, Claude Code IDE)
- `init/completion-corfu.el` - Code completion
- `init/selection-vertico.el` - Selection framework
- `init/git.el` - Git integration with Magit

## Development Commands

### Basic Operations
```bash
# Run isolated Emacs instance with project config only
make run

# Run with home directory config
make run EMACSD=home.el

# Check Emacs version
make version

# Byte compile all files
make compile

# Lint Emacs Lisp code
make lint

# Run checkdoc on code
make checkdoc

# Clean compiled files
make clean

# Purge installed packages
make purge
```

### Package Management
The configuration uses three package managers:
- **use-package**: Primary declarative package configuration
- **straight.el**: Git-based package management
- **quelpa**: Build packages from source (legacy)

### Language Servers
Eglot is configured for multiple languages with these external dependencies:
- `ccls` (C/C++)
- `clangd` (C/C++)
- `elixir-ls` (Elixir)
- `cmake-language-server` (CMake)
- `tailwindcss-language-server` (CSS)

## Key Features

### AI Integration
- GPTel for OpenAI/local LLM integration
- Ollama Buddy for local Ollama models
- Claude Code IDE extension

### Language Support
Configured for: Emacs Lisp, Python, Ruby, Rust, Go, Elixir, HTML, CSS, YAML, JSON, Org-mode, Pine Script, Assembly, and more.

### Evil Mode Integration
Vim-style keybindings with leader key mappings under SPC, preserving Emacs conventions where possible.

## Working with This Repository

When modifying configurations:
1. Edit the appropriate module file in `init/` or `langs/`
2. Some configurations use literate programming - check for corresponding `.org` files
3. Test changes with `make run` before committing
4. Use `make lint` to check code quality
5. Language-specific configs should go in `langs/` directory

The configuration is designed to be self-contained and reproducible across different environments.