# dotfiles

my personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). one command to get a new mac feeling like home.

## what's in here

- **zsh** - zshrc, zprofile, zshenv, p10k config, aliases, functions
- **git** - gitconfig and global gitignore
- **tmux** - tmux.conf with a spider-verse theme
- **ssh** - ssh client config

## setup on a new machine

```bash
git clone https://github.com/mugiwaraluffy56/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

the install script handles homebrew, all packages via Brewfile, and symlinks everything with stow.

## secrets

secrets like api keys are never committed. after cloning, copy the example file and fill it in:

```bash
cp ~/dotfiles/.secrets.example ~/.secrets
```

then add your keys to `~/.secrets`. the shell sources it automatically on startup.

## structure

```
dotfiles/
├── zsh/          # shell config
├── git/          # git config
├── tmux/         # tmux config
├── ssh/          # ssh config
├── Brewfile      # all homebrew packages
└── install.sh    # bootstrap script
```

## adding new configs

put files in the right package folder, then run `stow <package>` from `~/dotfiles`. stow creates the symlink automatically.
