# Klipper Vim Syntax Plugin

This project provides syntax highlighting for Klipper 3D printer configuration files within the Vim editor. It aims to improve readability and ease of editing for Klipper's `.cfg` files, which combine INI-like sections, key-value pairs, and multi-line G-code blocks with Jinja templating.

## Project Overview

The plugin consists of two main parts:

*   **`syntax/klipper.vim`**: This file defines the core syntax highlighting rules for Klipper configuration files. It includes rules for:
    *   Comments (starting with `#` or `;`)
    *   Boolean values (`true`, `false`)
    *   Numbers (integers and floats)    
    *   Sections (`[section_type section_identifier]`, e.g., `[printer]`, `[gcode_macro CANCEL_PRINT]`, `[include my_file.cfg]`)
    *   Configuration Keys (`klipperConfigKey`) and their associated values:
        *   Single-line values (`klipperConfigValueSingleLine`)
        *   Multi-line values (`klipperConfigValueMultiLine`), which follow indentation rules.
    *   G-code Macro Definitions (`klipperGcodeMacroName`):
        *   Identifies variables ending in `gcode` (e.g., `gcode`, `activate_gcode`).
        *   Leads to `klipperGcodeMacroBlock` for multi-line G-code content.
    *   G-code Blocks (`klipperGcodeMacroBlock`):
        *   Multi-line sections containing G-code commands (`klipperGcodeCommand`), parameters (`klipperGcodeParameter`), comments, and Jinja templates.
    *   Built-in Keywords (`klipperBuiltinKeyword`): Removed as redundant, specific highlighting is handled by other groups.
*   **`ftdetect/klipper.vim`**: This file is responsible for automatically detecting Klipper configuration files. It sets the Vim filetype to `klipper` for any file with a `.cfg` extension.

## Installation and Usage

To use this plugin, you typically place the `ftdetect` and `syntax` directories within your Vim configuration directory (e.g., `~/.vim/` or `~/.config/nvim/`).

**Example (for Vim):**

```bash
mkdir -p ~/.vim/ftdetect
mkdir -p ~/.vim/syntax
cp ftdetect/klipper.vim ~/.vim/ftdetect/
cp syntax/klipper.vim ~/.vim/syntax/
```

**Example (for Neovim):**

```bash
mkdir -p ~/.config/nvim/ftdetect
mkdir -p ~/.config/nvim/syntax
cp ftdetect/klipper.vim ~/.config/nvim/ftdetect/
cp syntax/klipper.vim ~/.config/nvim/syntax/
```

Once installed, open any `.cfg` file in Vim/Neovim, and it should automatically apply the Klipper syntax highlighting.

### Installation with a Plugin Manager

For modern Neovim setups using a plugin manager like
[Lazy.nvim](https://github.com/folke/lazy.nvim), you can add this plugin by
including it in your plugin specification.

**Example (for Lazy.nvim):**

```lua
{
  "ressu/vim-klipper-syntax",
  -- You can optionally make it lazy-loaded
  ft = "klipper",
}
```

This will automatically handle the installation and updates for you.

## Development Conventions

*   **Vimscript Syntax:** The plugin is written in Vimscript, adhering to Vim's syntax highlighting engine rules.
*   **Filetype Detection:** Filetype detection is handled via `ftdetect` scripts, following standard Vim plugin conventions.
*   **Jinja Integration:** The plugin includes a mechanism to integrate with a `syntax/jinja.vim` file (if available) for highlighting Jinja templates within G-code blocks.
