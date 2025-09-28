# Klipper Vim Syntax Plugin

This project provides syntax highlighting for Klipper 3D printer configuration files within the Vim editor. It aims to improve readability and ease of editing for Klipper's `.cfg` files, which combine INI-like sections, key-value pairs, and multi-line G-code blocks with Jinja templating.

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

### Manual Filetype Override

The plugin's automatic detection is designed to be accurate, but there may be
edge cases where you need to manually set the filetype. You can do this by
adding a "modeline" to the top or bottom of your Klipper configuration file.

**Example Modeline:**

Add this as the first or last line of your `.cfg` file:

```vim
# vim: set filetype=klipper:
```

This provides a reliable way to ensure syntax highlighting is applied correctly.

## Development Conventions

*   **Vimscript Syntax:** The plugin is written in Vimscript, adhering to Vim's syntax highlighting engine rules.
*   **Filetype Detection:** Filetype detection is handled via `ftdetect` scripts, following standard Vim plugin conventions.
*   **Jinja Integration:** The plugin includes a mechanism to integrate with a `syntax/jinja.vim` file (if available) for highlighting Jinja templates within G-code blocks.

## AI-Assisted Development

This project was developed with the assistance of AI tools. The AI-generated code
and suggestions were carefully guided, reviewed, and verified by the project
author to ensure correctness and quality.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

