# homebrew-tap

Homebrew formulae for [dor1a](https://github.com/dor1a)'s tools.

```sh
brew install dor1a/tap/suzu
brew install dor1a/tap/sshfzf
brew install dor1a/tap/aitop
brew install dor1a/tap/aibus
```

| Formula | What it does |
| -- | -- |
| [suzu](https://github.com/dor1a/suzu) | macOS notifications with the sender's own icon: Claude Code, Codex, or suzu's bell for your scripts |
| [sshfzf](https://github.com/dor1a/sshfzf) | Pick an SSH host from a tree with fzf; `~/.ssh/config` is generated from one `hosts.yaml` |
| [aitop](https://github.com/dor1a/aitop) | Live view of what Claude Code and Codex are running on this machine |
| [aibus](https://github.com/dor1a/aibus) | Status board on disk for the tools that run next to AI agents; aitop shows what they report |

suzu is built from source, so it needs the Xcode Command Line Tools. The others are scripts and run on the Python that ships with macOS.
