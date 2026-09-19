# ru.nvim

My personal Neovim configuration, built from scratch.

The goal is simple: **fast, lightweight, good-looking, and fully understood.**

I previously used LazyVim, but eventually wanted more control over my editor and a better understanding of how everything fits together. `ru.nvim` is my attempt to build that environment myself instead of assembling a large preconfigured distribution.

---

## Features

### Core

* Lua-based configuration
* `lazy.nvim` for plugin management
* Relative line numbers
* 2-space indentation
* Smart case-insensitive searching
* Rounded window borders
* System clipboard integration
* Split windows open to the right/below
* Cursor line highlighting

### UI

* One Dark Pro
* Bufferline
* Nvim-tree file explorer
* Rounded floating windows
* LSP diagnostics integrated into the editor

### Editing

* Fast completion with `blink.cmp`
* LSP-powered completion
* Automatic documentation in completion
* Format on save with Conform
* Prettier support
* System clipboard via `unnamedplus`
* Visual paste that preserves the existing clipboard

### LSP

* `nvim-lspconfig`
* Mason
* Mason LSP config
* Automatic LSP setup
* Lua language server configuration
* Definitions, references, implementations
* Rename and code actions
* Diagnostic navigation

### Treesitter

Treesitter is enabled for:

* Lua
* Vim
* Vimdoc
* JavaScript
* TypeScript
* TSX
* JSON
* Bash
* HTML
* CSS
* Markdown
* Markdown inline

### Search

[Telescope](https://github.com/nvim-telescope/telescope.nvim) is used for:

* File search
* Project-wide grep
* Buffer switching

Searches include hidden files while ignoring noisy directories such as:

* `.git`
* `node_modules`
* `dist`
* `.venv`

### Search & Replace

[grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) provides project and file-level search and replace with a live preview.

Current mappings:

```text
<leader>R   Search and replace across project
<leader>r  Search and replace in current file
```

### Git

[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) provides:

* Git change indicators
* Hunk navigation
* Hunk staging
* Hunk resetting
* Hunk preview
* Line blame

### File Explorer

[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) provides a visual sidebar file explorer.

The tree is intentionally kept close to its native behavior, with a few custom mappings:

```text
<leader>e  Toggle file explorer
h          Collapse directory
l          Expand directory / open file
m          Move file
r          Rename
H          Toggle hidden files
a          Create file/directory
d          Delete
R          Refresh
```

Hidden files are shown by default.

### Buffers

Buffer navigation:

```text
<S-l>       Next buffer
<S-h>       Previous buffer
<leader>bd  Delete buffer
```

---

## Keymaps

### Window navigation

```text
<C-h>  Move to left split
<C-j>  Move to lower split
<C-k>  Move to upper split
<C-l>  Move to right split
```

### LSP

```text
gd         Go to definition
gr         Find references
gI         Go to implementation

<leader>rn Rename
<leader>ca Code action
```

### Diagnostics

```text
[d         Previous diagnostic
]d         Next diagnostic
<leader>d  Show diagnostic
```

### Telescope

```text
<leader><leader>  Find files
<leader>f         Live grep
<leader>bb        Find buffers
```

### Splits

```text
<leader>|  Vertical split
<leader>-  Horizontal split
```

### Formatting

```text
<C-S-i>  Format buffer
```

### Git

```text
[c         Previous hunk
]c         Next hunk

<leader>hs  Stage hunk
<leader>hr  Reset hunk
<leader>hp  Preview hunk
<leader>hb  Blame line
```

### Clipboard

System clipboard integration is enabled through:

```lua
vim.opt.clipboard = "unnamedplus"
```

Visual paste is configured so that replacing a selection does not overwrite the existing clipboard contents.

---

## Installation

Clone the repository into your Neovim configuration directory:

```bash
git clone <repo-url> ~/.config/nvim
```

Then launch:

```bash
nvim
```

`lazy.nvim` bootstraps automatically on first launch.

### Requirements

* Neovim 0.12+
* Git
* A working system clipboard provider
* A Nerd Font is recommended for icons

On Wayland, `wl-clipboard` provides the system clipboard integration.

---

## Structure

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── README.md
└── lua/
    ├── config/
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins/
        ├── bufferline.lua
        ├── completion.lua
        ├── explorer.lua
        ├── formatter.lua
        ├── git.lua
        ├── lsp.lua
        ├── replace.lua
        ├── telescope.lua
        ├── theme.lua
        └── treesitter.lua
```

The configuration is intentionally split by responsibility:

* `config/options.lua` — editor options
* `config/keymaps.lua` — global keymaps
* `plugins/` — plugin configuration

---

## Philosophy

`ru.nvim` is built around a few rules:

1. **Understand the tool before configuring it.**
2. **Use native Neovim functionality whenever possible.**
3. **Don't add a plugin just because everyone else uses it.**
4. **Keep configuration small and readable.**
5. **Optimize for actual workflow annoyances.**
6. **Measure performance instead of guessing.**

The goal isn't to recreate someone else's Neovim distribution.

It's to build an editor that feels right because I understand why every piece is there.

---

## Things intentionally avoided

Some popular plugins/features are intentionally not part of this setup.

For example:

* Snacks.nvim
* fzf-lua
* Large all-in-one configuration frameworks
* Plugins that duplicate functionality already provided by Neovim or an existing plugin

If something can be solved cleanly with a few lines of native Lua, that's usually preferable.

---

## Future

The configuration is intentionally evolving through actual use rather than a predefined checklist.

Potential additions will be driven by real workflow problems rather than by trying to recreate a "complete" Neovim setup.
