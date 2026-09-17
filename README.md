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
* System clipboard integration

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

| Key         | Action           |
| ----------- | ---------------- | 
| `<leader>\|`| Vertical split   |
| `<leader>-` | Horizontal split |

### Buffers

| Key          | Action                             |
| ------------ | ---------------------------------- |
| `<S-h>`      | Previous buffer                    |
| `<S-l>`      | Next buffer                        |
| `<leader>bd` | Delete current buffer              |
| `<leader>bb` | Pick an open buffer with Telescope |

### LSP

| Key          | Action                     |
| ------------ | -------------------------- |
| `gd`         | Go to definition           |
| `gr`         | Find references            |
| `gI`         | Go to implementation       |
| `K`          | Show LSP hover information |
| `<leader>rn` | Rename symbol              |
| `<leader>ca` | Code action                |

### Diagnostics

| Key         | Action              |
| ----------- | ------------------- |
| `[d`        | Previous diagnostic |
| `]d`        | Next diagnostic     |
| `<leader>d` | Show diagnostic     |

### Telescope

| Key                | Action            |
| ------------------ | ----------------- |
| `<leader><leader>` | Find files        |
| `<leader>f`        | Live grep         |

### Formatting

| Key       | Action                |
| --------- | --------------------- |
| `<C-S-i>` | Format current buffer |

## Installation

### Requirements

* Neovim 0.12+
* Git
* `ripgrep` for Telescope live grep
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
        ├── completion.lua
        ├── formatting.lua
        ├── lsp.lua
        ├── telescope.lua
        ├── treesitter.lua
        └── bufferline.lua
```

The configuration is intentionally split by responsibility rather than putting everything into one large file.

## Future Plans

The setup will continue to grow based on actual needs rather than adding plugins for the sake of having features.

### High Priority

* [ ] Harpoon

  * Quickly mark important project files
  * Jump between frequently used files

* [ ] Git integration

  * Git signs
  * Diff workflow
  * Stage/unstage changes
  * Blame when needed

* [ ] Diagnostic UX improvements

  * Improve diagnostic signs
  * Clean up virtual text
  * Better navigation workflow

* [ ] Search and replace workflow

  * Project-wide replacement
  * Keep the workflow simple and Telescope/native-first

### Medium Priority

* [ ] Which-key

  * Improve keymap discoverability as the configuration grows

* [ ] Git conflict workflow

  * Better handling of merge conflicts and diffs

* [ ] Terminal workflow

  * Evaluate whether a terminal plugin is actually necessary

* [ ] Project/session management

  * Restore useful buffers and windows when returning to projects

### Low Priority

* [ ] Better file explorer

  * Native `:Ex` is sufficient for now

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

The goal is not to have the smallest possible plugin count.

The goal is to have **only plugins that are worth having**.

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

