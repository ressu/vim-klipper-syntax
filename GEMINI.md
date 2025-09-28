# Project: vim-klipper-syntax

This is a Vim/Neovim syntax highlighting plugin for Klipper 3D printer
configuration files (`.cfg`).

## Project Structure

- `ftdetect/klipper.vim`: Detects `.cfg` files and sets the filetype to `klipper`.
- `syntax/klipper.vim`: Contains the syntax highlighting rules for the `klipper`
  filetype.
- `GEMINI.md`: This file. Contains project context for the Gemini LLM.
- `README.md`: User-facing documentation with installation and usage instructions.

## Development Conventions

- The plugin is written in Vimscript.
- Follow existing conventions in the files when making changes.