# dotfiles

Machine config managed with [mise](https://mise.jdx.dev). Public: never commit secrets.

## New machine

```sh
curl -fsSL https://mise.run | sh   # or: brew install mise
git clone https://github.com/deankerr/dotfiles ~/code/dotfiles
mkdir -p ~/.config/mise
ln -s ~/code/dotfiles/mise/config.toml ~/.config/mise/config.toml
mise install
```

Then put `~/.local/share/mise/shims` first on PATH in the login env, and add
`eval "$(mise activate <shell>)"` to the interactive rc.

## Layout

| Path               | Target                       |
| ------------------ | ---------------------------- |
| `mise/config.toml` | `~/.config/mise/config.toml` |
