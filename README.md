# dotfiles

Machine config for the Mac and fserv, managed with [mise](https://mise.jdx.dev). Public: never commit secrets.

| Path               | Deployed to                                                |
| ------------------ | ---------------------------------------------------------- |
| `mise/config.toml` | `~/.config/mise/config.toml`: tools, shell aliases, dotfiles |
| `zsh/`             | `~/.zshenv`, `~/.zprofile`, `~/.zshrc`, `~/.config/zsh/plugins.txt` |
| `atuin/`           | `~/.config/atuin/config.toml`                              |
| `herdr/`           | `~/.config/herdr/config.toml`                              |

- Every deployed file is a symlink into this repo. Edit either side; commit here.
- Installers that append to `~/.zshrc` write into this repo. `git status` shows them: move machine-only
  lines to `~/.config/zsh/local.zsh` (untracked), keep shared ones, discard the rest.
- `mise dot status` shows a deployed file that an app replaced instead of editing.

## New machine

```sh
curl -fsSL https://mise.run | sh   # or: brew install mise
git clone https://github.com/deankerr/dotfiles ~/code/dotfiles
mkdir -p ~/.config/mise
ln -s ~/code/dotfiles/mise/config.toml ~/.config/mise/config.toml
~/.local/bin/mise install
~/.local/bin/mise dot apply   # move conflicting existing files aside first
chsh -s "$(command -v zsh)"
```
