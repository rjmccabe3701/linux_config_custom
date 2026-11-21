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
   [.gitconfig-persional](dot_files/gitconfig-personal) gitconfig. These are
   mapped to my personal github.

2. Repos under the `~/repos/work` directory use the
   [.gitconfig-persional](dot_files/gitconfig-work) gitconfig. These are mapped
   to my work github. _NOTE: my employer enforces SSO, so I needed to "Configure
   SSO" for the SSH I add to the github UI._

To generate an SSH key do this

```bash
ssh-keygen -t ed25519 -C "robert.mccabe@collins.com"
```

Then add to Github (`Settings/SSH and GPG keys`)

## LazyVim configuration

Use a supported stable Neovim (currently LazyVim requires 0.11.2+) with Git, a C
compiler and tree-sitter-cli. On an Intel Mac, use compatible packages for your
macOS version; the Linux AppImage is not a macOS installation method.

`rob_plugins.lua` enables LazyVim's clangd, Python and Telescope extras. It uses
Pyright plus Ruff for Python, bash-language-server plus ShellCheck for shell
analysis, and shfmt/clang-format for formatting. Mason manages editor tools;
Node is needed by the JavaScript-based language servers. C++ projects should
export `compile_commands.json`; Python projects should have their own `.venv`.

Gruvbox, Telescope search, netrw, Flash mappings, disabled inlay hints, disabled
pair insertion and disabled Noice are preserved. Neovim chooses the clipboard
provider automatically (pbcopy/pbpaste on macOS). On WSL, configure an available
provider deliberately; xclip is no longer forced on every operating system.

Go/Rust servers, parsers and unrelated tools are no longer installed by this
custom file. Existing installations and `lazyvim.json` selections are preserved.
Enable the Go/Rust extras through `:LazyExtras` if needed. Review existing extras
for overlapping providers; do not enable a second Python server alongside Pyright.

The installer retains an existing LazyVim setup and backs up the two files it
replaces. It does not delete the config, data or state directories. New setups
start from LazyVim starter. Keep its `lazy-lock.json` after successful validation;
this repository does not invent or update a plugin lock without a full sync.

### Isolated editor trial

Copy your existing LazyVim configuration to a separate configuration directory
named `nvim-cleanup`, then copy `rob_options.lua` to its `lua/config/options.lua`
and `rob_plugins.lua` to its `lua/plugins/rob_plugins.lua`. Start it with:

```bash
NVIM_APPNAME=nvim-cleanup nvim
```

This separates Neovim's configuration, plugin data, state and cache from your
normal `nvim` instance. Run `:checkhealth`, inspect `:LspInfo` in C++, Python and
Bash files, test formatting and clipboard copying, and verify the netrw shortcuts.
Do not run the installer against your normal home until the trial is satisfactory.
