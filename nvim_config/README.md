# Neovim configuration

https://github.com/jdhao/nvim-config/blob/master/docs/README.md


Looks like cscope support has been removed in the latest neovim. This is how you setup browsing for the linux kernel:
https://www.reddit.com/r/emacs/comments/y7lwo3/help_a_linux_kernel_dev_setup_lsp/

```sh
make CC=clang defconfig
scripts/clang-tools/gen_compile_commands.py
```
