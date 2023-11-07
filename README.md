# Dotfiles Repository

This repository contains my dotfiles, which are configuration files used to customize my command-line environment, primarily for the Zsh shell and related tools.

## Files

Here's a quick overview of the key dotfiles and their purposes:

- **`.zshrc`**: Configuration for the Zsh shell, including aliases and custom settings.

- **`.gitconfig`**: Git configuration, including user information and aliases.

- **`.vimrc`** (or **`.nvimrc`**): Vim or Neovim text editor configuration, including keybindings and plugins.

- **`.tmux.conf`**: Configuration for the Tmux terminal multiplexer.

- **`.ssh/config`**: SSH configuration for managing different host connections.

- **`.editorconfig`**: Standardized coding style settings for various code editors or IDEs.

- **Utility Scripts**: Custom shell scripts for automating tasks or setting up the environment.

- **`.inputrc`**: Configuration for command-line editing using the Readline library.

- **`.profile` (or **`.bash_profile`**): Environment variables and settings for new shell sessions.

- **`.Xresources`** (or **`.Xdefaults`**): Configuration for X Window System applications.

## Usage

To set up your command-line environment using these dotfiles, follow these steps:

1. Clone this repository to your home directory:

```bash
git clone <repository_url> ~/.dotfiles
```

2. Create symbolic links to the dotfiles in your home directory. For example, to link the `.zshrc` file:

```bash
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```

3. Repeat step 2 for other dotfiles you want to use.

4. Make any customizations or additions to these dotfiles as needed.

5. Reload your shell or start a new shell session to apply the changes.

## License

This repository is provided under the MIT [LICENSE](LICENSE) and is open for personal use and customization.

Feel free to fork this repository and adapt it to your preferences. If you find any issues or have suggestions for improvements, please create an issue or a pull request.

Enjoy your customized command-line environment!
