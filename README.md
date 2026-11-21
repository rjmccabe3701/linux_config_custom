## My `linux_config` customizations

This is a plugin for the
[linux_config](https://github.com/rjmccabe3701/linux_config) repository

## Install

```bash
git clone https://github.com/rjmccabe3701/linux_config.git
git clone https://github.com/rjmccabe3701/linux_config_custom.git
linux_config/install.sh linux_config_custom
```

## SSH Key setup

I now support multiple git contexts

1. Repos under the `~/repos/personal` directory use the
   [.gitconfig-personal](dot_files/gitconfig-personal) gitconfig. These are
   mapped to my personal github.

2. Repos under the `~/repos/work` directory use the
   [.gitconfig-work](dot_files/gitconfig-work) gitconfig. These are mapped
   to my work github. _NOTE: my employer enforces SSO, so I needed to "Configure
   SSO" for the SSH I add to the github UI._

To generate an SSH key do this

```bash
ssh-keygen -t ed25519 -C "robert.mccabe@collins.com"
```

Then add to Github (`Settings/SSH and GPG keys`)

## LazyVim configuration

This configuration works without Node.js/npm. Use a compatible Neovim release
binary for your Mac (LazyVim requires Neovim 0.11.2+); Homebrew Neovim is not
required. The shell recognizes `~/nvim-macos-x86_64/bin` when it exists.
Keep the working `lazy-lock.json` and update plugins deliberately; the installer
does not upgrade Neovim or Homebrew packages.

`rob_lazy.lua` loads LazyVim, its clangd/Python/Telescope extras, then your
`rob_plugins.lua` overrides. Keep this order when copying the configuration.

- **C/C++:** clangd navigation and completion, with clang-format formatting.
  Export `compile_commands.json` from your build, for example with CMake's
  `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` option.
- **Python:** Ruff diagnostics and code actions; Pyright, basedpyright and pylsp
  are disabled. Python type checking and language-server completion are absent.
  Use a separate `.venv` for each project.
- **Bash:** ShellCheck diagnostics when available, shfmt formatting, and syntax
  highlighting. The Node-dependent bash-language-server is disabled.

Mason manages native editor tools such as clangd, Ruff, ShellCheck, shfmt,
clang-format and StyLua. Their platform support still depends on the downloaded
release; there is no requirement to build Node or replace working system tools.
Telescope uses `rg` for text search; `fd` improves file finding but is optional.
Tree-sitter parsers may require a C compiler; some grammars also require the
standalone tree-sitter CLI. Node is not required by this personal configuration.

Gruvbox, Telescope, netrw, Flash mappings, disabled inlay hints, disabled pair
insertion and disabled Noice are preserved. Clipboard support uses pbcopy/pbpaste
on macOS. Go/Rust tooling is not added by this custom configuration. Existing
`lazyvim.json` extras are preserved; adding extras can introduce new dependencies.

The installer backs up and links three files: `lua/config/lazy.lua`,
`lua/config/options.lua` and `lua/plugins/rob_plugins.lua`. It preserves other
configuration, plugins and editor data. New configurations use LazyVim starter.

### Isolated editor trial

Copy your existing configuration to `~/.config/nvim-cleanup`, then copy:

- `rob_lazy.lua` to `lua/config/lazy.lua`
- `rob_options.lua` to `lua/config/options.lua`
- `rob_plugins.lua` to `lua/plugins/rob_plugins.lua`

Replace copied symlinks before editing them so the trial cannot change the live
configuration. Start the trial with:

```bash
NVIM_APPNAME=nvim-cleanup nvim
```

This uses separate configuration, plugin data, state and cache, so its first
startup may download plugins and tools. For ordinary use, simply restart Neovim
after changing the linked files. Check `:LspInfo`, `:ConformInfo` and
`:checkhealth` if a tool fails; do not install Node to resolve disabled servers.
