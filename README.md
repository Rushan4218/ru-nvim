# ru.nvim

My personal Neovim configuration, built from scratch with Lua.

The goal is a **fast, minimal, understandable development environment** without relying on a large preconfigured distribution such as LazyVim.

I want to understand what every major part of my editor does, while still having the conveniences I use every day.

## Philosophy

* Native Neovim functionality first
* Add a plugin only when it provides meaningful value
* Keep the configuration modular and easy to understand
* Avoid large "do everything" plugins
* Optimize for responsiveness and LSP/completion performance
* Prefer simple keymaps over layers of abstractions
* Build the setup incrementally and actually use it before adding more

The goal is not to minimize the number of plugins.

The goal is to have **only plugins that are worth having**.

## Current Setup

### Core

* Lua-based configuration
* `lazy.nvim` for plugin management
* Custom configuration built from scratch
* Leader key: `<Space>`
* Local leader: `<Space>`

### UI

* One Dark Pro
* Transparent background
* Rounded floating windows
* Relative line numbers
* Current line shown with an absolute number
* Cursor line highlighting
* VS Code-style bufferline

### Editing

* 2-space indentation
* Spaces instead of tabs
* Case-insensitive search with smart case
* Split windows open to the right and below
* Native Neovim editing functionality wherever possible

### LSP

Configured through:

* `nvim-lspconfig`
* `mason.nvim`
* `mason-lspconfig.nvim`

Mason manages language-server installation, while `mason-lspconfig` automatically enables available language servers based on the current environment and filetypes.

The configuration is designed to be extensible to any language supported by the LSP ecosystem.

### Completion

* `blink.cmp`

Completion is provided through the LSP where available, with automatic documentation support.

The configuration intentionally keeps completion sources minimal to prioritize responsiveness.

### Treesitter

Treesitter is used for syntax highlighting and indentation.

The configuration installs parsers for the languages and formats needed by the development environment.

### Formatting

* `conform.nvim`
* Prettier for supported web/configuration filetypes
* Format on save
* Manual formatting with `<C-S-i>`

### File Search

* `telescope.nvim`
* `plenary.nvim`

Current Telescope workflow:

* Find files
* Live grep
* Search hidden files
* Search gitignored files
* Ignore `.git`, `node_modules`, `dist`, and `.venv`
* Search currently open buffers

### Search and Replace

* `grug-far.nvim`

Provides a VS Code-like search and replace workflow without requiring a custom implementation.

Current workflow:

* Project-wide search and replace
* Current-file search and replace
* Search and replacement fields in one buffer
* Live match and replacement preview
* Explicitly apply replacements

Keymaps:

* `<leader>r` — Search and replace across the project
* `<leader>rf` — Search and replace in the current file

### Git

* `gitsigns.nvim`

Gitsigns provides lightweight Git context inside the editor while Git CLI remains the primary Git interface.

Current workflow:

* Navigate between changed hunks
* Stage hunks
* Reset hunks
* Preview hunks
* Blame the current line

### Buffers

* `bufferline.nvim`
* Buffer tabs displayed at the top
* Current buffer highlighted
* Previous/next buffer navigation
* Buffer deletion

## Keymaps

Leader:

```text
<Space>
```

### Window Navigation

| Key     | Action              |
| ------- | ------------------- |
| `<C-h>` | Move to left split  |
| `<C-j>` | Move to lower split |
| `<C-k>` | Move to upper split |
| `<C-l>` | Move to right split |

### Splits

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>\|` | Vertical split   |
| `<leader>-`  | Horizontal split |

### Buffers

| Key          | Action                             |
| ------------ | ---------------------------------- |
| `<S-h>`      | Previous buffer                    |
| `<S-l>`      | Next buffer                        |
| `<leader>bd` | Delete current buffer              |
| `<leader>bb` | Pick an open buffer with Telescope |

### LSP

| Key          | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Find references      |
| `gI`         | Go to implementation |
| `K`          | Show LSP hover       |
| `<leader>rn` | Rename symbol        |
| `<leader>ca` | Code action          |

### Diagnostics

| Key         | Action              |
| ----------- | ------------------- |
| `[d`        | Previous diagnostic |
| `]d`        | Next diagnostic     |
| `<leader>d` | Show diagnostic     |

### Telescope

| Key                | Action     |
| ------------------ | ---------- |
| `<leader><leader>` | Find files |
| `<leader>f`        | Live grep  |

### Formatting

| Key       | Action                |
| --------- | --------------------- |
| `<C-S-i>` | Format current buffer |

### Git

| Key          | Action             |
| ------------ | ------------------ |
| `[c`         | Previous Git hunk  |
| `]c`         | Next Git hunk      |
| `<leader>hs` | Stage hunk         |
| `<leader>hr` | Reset hunk         |
| `<leader>hp` | Preview hunk       |
| `<leader>hb` | Blame current line |

### Search and Replace

| Key          | Action                             |
| ------------ | ---------------------------------- |
| `<leader>r`  | Search and replace across project  |
| `<leader>rf` | Search and replace in current file |

## Installation

### Requirements

* Neovim 0.12+
* Git
* `ripgrep` for Telescope live grep and project search/replace
* Node.js / npm for Prettier-based formatting
* A terminal with true-color support
* A Nerd Font or compatible terminal font is recommended

### Install

Clone `ru.nvim` directly into Neovim's default configuration directory:

```bash
git clone <repository-url> ~/.config/nvim
```

Then simply start Neovim:

```bash
nvim
```

The configuration bootstraps `lazy.nvim` automatically on first launch.

> **Warning:** Installing `ru.nvim` into `~/.config/nvim` replaces the existing Neovim configuration at that location. Back up your existing configuration first if you have one.

### Updating Plugins

Inside Neovim:

```vim
:Lazy
```

Or synchronize plugins directly:

```vim
:Lazy sync
```

## Configuration Structure

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── README.md
└── lua/
    ├── config/
    │   ├── options.lua
    │   ├── keymaps.lua
    │   └── theme.lua
    │
    └── plugins/
        ├── bufferline.lua
        ├── completion.lua
        ├── formatting.lua
        ├── git.lua
        ├── lsp.lua
        ├── replace.lua
        ├── telescope.lua
        └── treesitter.lua
```

The configuration is intentionally split by responsibility rather than putting everything into one large file.

## Future Plans

The setup will continue to grow based on actual needs rather than adding plugins for the sake of having features.

### High Priority

* [ ] File explorer

  * Add a lightweight dedicated file explorer
  * Provide a fast project/file navigation workflow
  * Prefer a focused plugin rather than an all-in-one plugin such as Snacks.nvim
  * Keep the workflow simple and keyboard-friendly

* [ ] System clipboard integration

  * Make yanks from Neovim available in the system clipboard
  * Make system clipboard contents available inside Neovim
  * Preserve the existing clipboard when pasting over a visual selection
  * Prefer Neovim's native clipboard/register functionality over adding a clipboard plugin

### Medium Priority

* [ ] Git conflict workflow

  * Better handling of merge conflicts
  * Improve diff/navigation workflow if actual usage reveals a need

* [ ] Terminal workflow

  * Evaluate whether a terminal plugin is actually necessary

* [ ] Project/session management

  * Restore useful buffers and windows when returning to projects

### Low Priority

* [ ] Better file explorer customization

  * Only if the initial explorer workflow proves insufficient

* [ ] Telescope image preview

  * Intentionally postponed

## Plugins I Intentionally Do Not Want

This configuration deliberately avoids:

* Snacks.nvim
* fzf-lua
* Large all-in-one Neovim distributions
* Unnecessary statusline plugins
* Unnecessary dashboard plugins
* Plugins that duplicate functionality already provided by Neovim
* Plugins added only because they are popular

A plugin is not rejected simply because it is large.

It is rejected when its additional functionality is not worth the complexity it introduces to this configuration.

## Development Approach

This configuration is built incrementally.

Each feature follows roughly this process:

```text
Build
  ↓
Test
  ↓
Use
  ↓
Identify actual pain
  ↓
Add only what solves that pain
```

The configuration should remain understandable even as it grows.

No feature is considered necessary just because another Neovim configuration has it.

