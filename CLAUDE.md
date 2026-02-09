# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal dotfiles managed with **Dotbot**. Each top-level directory groups configs for one tool, and `install.conf.yaml` declares symlinks from `~` into the repo.

## Install / Apply Changes

```bash
./install            # runs dotbot: updates submodules, creates symlinks, installs vim plugins
```

There is no build, lint, or test step. The only command is `./install`. After editing any config file the change is live immediately (files are symlinked), but run `./install` after changing `install.conf.yaml` or adding new link targets.

## Actively Symlinked (what's actually in use on this system)

| Symlink | Source dir | Tool |
|---------|-----------|------|
| `~/.zshrc`, `~/.zpreztorc`, `~/.zprezto` | `zsh/`, `prezto/` | Zsh + Prezto |
| `~/.aliases.sh` | `aliases/` | Shell aliases (`dark`/`light` theme switchers, ls aliases) |
| `~/.vimrc`, `~/.gvimrc`, `~/.vim` | `vim/` | Vim + Vundle |
| `~/.tmux.conf` | `tmux/` | tmux (prefix: Ctrl-A, vi keys) |
| `~/.gitconfig`, `~/.git-completion.*` | `git/` | Git |
| `~/.aerospace.toml` | `aerospace/` | AeroSpace tiling WM |
| `~/.claude/CLAUDE.md`, `~/.claude/settings.json`, `~/.claude/skills` | `claude/` | Claude Code (global instructions, settings, skills) |

**Not currently linked** (declared in config but missing on disk or overridden): bash, ipython, jupyter, python, ssh/config, `~/.config`, `~/.dotfiles`.

**Broken symlinks**: `~/.tmux_solarizedlight_nargoth.conf` and `~/.tmux_tomorrowdark.conf` (source files deleted from repo).

## Repo Layout

```
install.conf.yaml   # Dotbot config -- the single source of truth for all symlinks
install             # Dotbot bootstrap script
dotbot/             # Submodule: github.com/anishathalye/dotbot
prezto/.zprezto     # Submodule: custom Prezto fork (Nargoth/prezto)
vim/.vim/bundle/    # Gitignored; populated by Vundle at install time
```

Config directories (`aerospace/`, `aliases/`, `claude/`, `git/`, `tmux/`, `vim/`, `vscode/`, `zsh/`) each mirror the home-directory layout so dotbot can link them directly.

`vscode/` contains `settings.json`, `keybindings.json`, and `extensions.sh` but is **not managed by dotbot** -- these are tracked for reference/manual setup only.

## Git Submodules

Four submodules (dotbot, prezto, base16-shell, Vundle.vim). Always use `git submodule update --init --recursive` after cloning or pulling submodule pointer changes. The `./install` script handles this automatically.

## Key Conventions

- Shell: Zsh is the primary shell; bash configs exist but are not active.
- Vim plugins: Managed by Vundle (not vim-plug or lazy.nvim). Add plugins to `.vimrc` then run `vim +PluginInstall +qall`.
- tmux prefix: `Ctrl-A` (not the default `Ctrl-B`).
- AeroSpace workspaces: Named workspaces (term, code, browse, comms, private, mail, track) with vim-style hjkl navigation.
- Theme switching: `dark()` and `light()` shell functions toggle iTerm2 profiles and base16 color schemes, but the tmux theme files they reference are currently broken (deleted).
