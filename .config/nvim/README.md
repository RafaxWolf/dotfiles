# Neovim

Personal Neovim configuration organized into settings, keybindings, plugins, themes, and plugin-specific files.

***Language***
- 🇺🇸 English
- [🇪🇸 Español](./README.es.md)

## Features

- Vim-Plug plugin management.
- CoC completion and language tooling.
- NERDTree, Ranger, and FZF integration.
- Signify Git indicators.
- Commenting, indentation guides, tag closing, and formatting.
- Multiple themes, including TokyoNight, Dracula, Ayu, Material, Monokai, and OneDark.
- Separate behavior for standalone Neovim and VS Code integration.

## Installation

### 1) Install base packages (Arch Linux)

For this setup, install at least these tools:

```bash
pacman -S neovim git curl nodejs npm ripgrep fzf ranger
```

> Some plugins may need extra runtime dependencies depending on your language stack.

### 2) Install Vim-Plug

The Vim-Plug package name can vary by distribution.

#### Option A (Arch Linux / AUR, preferred when available)

```bash
paru -S vim-plug
```

#### Option B (official fallback, works everywhere)

```bash
mkdir -p ~/.local/share/nvim/site/autoload
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This path is for **Neovim** (`~/.local/share/nvim/site/autoload/plug.vim`).

### 3) Install plugins

Open Neovim:

```bash
nvim
```

Run:

```vim
:PlugInstall
```

Then restart Neovim.

Useful Vim-Plug commands:

- `:PlugUpdate` update plugins.
- `:PlugClean` remove plugins not listed anymore.
- `:PlugStatus` check plugin status.

The main entry point is [`init.vim`](./init.vim). Plugin declarations are in [`vim-plug/plugins.vim`](./vim-plug/plugins.vim).

## Shortcuts

`<Leader>` is `\\` in Vim/Neovim by default, unless another config changes it.
In this repository, standalone Neovim sets `mapleader` to `<Space>` (`general/settings.vim`), while VS Code mode can behave differently.

### Global/basic mappings

| Mode | Shortcut | Action | Notes |
| --- | --- | --- | --- |
| Normal | `Ctrl+C` (`<C-c>`) | Escape (`<Esc>`) | Quick cancel |
| Insert | `j then k` / `k then j` / `j then j` / `k then k` (`jk`, `kj`, `jj`, `kk`) | Exit insert mode | Fast Escape alternatives |
| Normal | `Ctrl+S` (`<C-s>`) | Save (`:w`) | |
| Normal | `Ctrl+Q` (`<C-q>`) | Save and quit (`:wq!`) | |
| Normal | `Ctrl+B` (`<C-b>`) | Close current buffer (`:bd`) | |
| Normal | `Alt+J` / `Alt+K` (`<M-j>`, `<M-k>`) | Resize window height | `-2` / `+2` |
| Normal | `Alt+H` / `Alt+L` (`<M-h>`, `<M-l>`) | Resize window width | `-2` / `+2` |
| Normal | `Ctrl+H` / `Ctrl+J` / `Ctrl+K` / `Ctrl+L` (`<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`) | Move between windows | |
| Normal *(not VS Code)* | `Tab` / `Shift+Tab` (`<Tab>`, `<S-Tab>`) | Next/previous buffer | Only when `!exists('g:vscode')` |
| Visual | `J` / `K` | Move selected lines down/up | Keeps selection |
| Visual | `<` / `>` (`<`, `>`) | Re-indent and keep selection | `gv` |

### Plugin mappings (standalone Neovim)

| Mode | Shortcut | Action | Plugin/Source |
| --- | --- | --- | --- |
| Normal | `Space, then n` (`<Leader>n`) | Toggle NERDTree | NERDTree |
| Normal | `Space, then e` (`<Leader>e`) | `:CocCommand explorer` | CoC explorer |
| Normal | `Space, then r` (`<Space>r`) | Toggle Ranger (`:RnvimrToggle`) | rnvimr |
| Normal | `Space, then b` (`<Leader>b`) | `:Buffers` | FZF |
| Normal | `Space, then g` (`<Leader>g`) | `:Rg` | FZF |
| Normal | `Space, then t` (`<Leader>t`) | `:Tags` | FZF |
| Normal | `Space, then m` (`<Leader>m`) | `:Marks` | FZF |
| Normal | `Space, then p` (`<Leader>p`) | `:Prettier` | prettier.vim mapping |
| Normal/Visual | `Space, then /` (`<Space>/`) | Comment toggle (`:Commentary`) | vim-commentary |
| Normal | `Space, then g, then j` / `Space, then g, then k` (`<Leader>gj`, `<Leader>gk`) | Next/previous git hunk | vim-signify |

### CoC mappings (standalone Neovim)

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal | `[ then g` / `] then g` (`[g`, `]g`) | Previous/next diagnostic |
| Normal | `g then d` / `g then y` / `g then i` / `g then r` (`gd`, `gy`, `gi`, `gr`) | Go to definition/type/implementation/references |
| Normal | `K` | Show documentation/hover |
| Normal | `Space, then r, then n` (`<Leader>rn`) | Rename symbol |
| Normal/Visual | `Space, then a` (`<Leader>a`) | Code action (selected/current) |
| Normal | `Space, then a, then c` (`<Leader>ac`) | Code action for current buffer |
| Normal | `Space, then q, then f` (`<Leader>qf`) | Auto-fix current line |
| Visual + Operator-pending | `i then f` / `a then f` (`if`, `af`) | Function text objects (inner/around) |
| Visual + Operator-pending | `i then c` / `a then c` (`ic`, `ac`) | Class text objects (inner/around) |

### `<Leader>f` mapping collision

`<Leader>f` is mapped in two places:

- CoC: format selected/current (`nmap/xmap <leader>f`)
- FZF: file finder (`map <Leader>f :Files<CR>`)

Because both mappings exist, behavior can differ by mode and mapping precedence/load order.
If needed, inspect with `:verbose map <Leader>f` and `:verbose xmap <Leader>f`.

### VS Code mode

| Mode | Shortcut | Action |
| --- | --- | --- |
| Normal (VS Code Neovim integration) | `s` (`s`) | EasyMotion two-character jump |

Review plugin runtime requirements before installing language tooling.
