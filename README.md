# My Personal Dotfiles

## Installation

### 1. Install `zsh` if needed
```
sudo apt install zsh
```
or
```
brew install zsh  # Should be pre-installed in macOS
```

### 2. Change default shell to `zsh`
```
chsh -s zsh
```

### 3. Clone and link dotfiles
```
git clone https://github.com/mhjuan/dotfiles.git
ln -s dotfiles/.gitconfig ~/.gitconfig
ln -s dotfiles/.zshrc ~/.zshrc
```

### 4. Setup git config
- Name
- Email
- SSH
    - [Github SSH setup](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
- GPG
    - [Github GPG setup](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)

### 5. For macOS, install brew
- [brew.sh](https://brew.sh)
- For Apple Silicon
    - a. Install the ARM version (default) brew first at `/opt/homebrew/bin/`
    - b. Do **6.** first
    - c. `brew install iterm2`
    - d. Duplicate iterm2 app for x86 arch and install x86 version brew
    - e. `ln -s dotfiles/.zprofile ~/.zprofile && ln -s dotfiles/.zprofile ~/.profile`

### 6. Install `zplug`, load `zsh` plugins, and setup shell settings
- For macOS, `brew install coreutils` first.
    - Required at least for colored `ls` to work.
    - Remember to add `export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"` to `.zshrc` file.
- `source .zshrc`
- If substring search using arrow key up/down not working, check keystroke by `cat -v` and change it in line 54, 55.
- [Github page of zplug](https://github.com/zplug/zplug)
