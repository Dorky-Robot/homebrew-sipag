# homebrew-sipag

[Homebrew](https://brew.sh) tap for [sipag](https://github.com/Dorky-Robot/sipag) — conversational agile for Claude Code.

## Install

```bash
brew tap Dorky-Robot/sipag
brew install sipag
```

## What gets installed

- **`sipag`** — the Rust CLI binary (queue management, TUI, Docker sandbox control)
- **Bash helpers** — `sipag start`, `sipag work`, `sipag merge`, `sipag setup` in `libexec/`

To use the bash commands (`sipag start <repo>`, `sipag work <repo>`, etc.), add this to your shell profile:

```bash
export PATH="$(brew --prefix sipag)/libexec/bin:$PATH"
```

## Updating

```bash
brew upgrade sipag
```

## Formula source

The formula in `Formula/sipag.rb` is auto-updated by the [sipag release workflow](https://github.com/Dorky-Robot/sipag/blob/main/.github/workflows/release.yml) whenever a new version tag is pushed.
