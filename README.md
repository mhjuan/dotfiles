# My Personal Dotfiles

## Installation

### 1. Setup git config
- Name
- Email
- SSH
    - [Github SSH setup](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
- GPG
    - [Github GPG setup](https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)

### 2. Install `zsh`
```
sudo apt install zsh
```
or
```
brew install zsh
```
if needed

### 3. Change default shell to `zsh`
```
chsh -s zsh
```

### 4. Clone dotfiles

### 5. Install `zplug`, load `zsh` plugins, and setup shell settings
- For macOS, `brew install coreutils` first.
    - Required at least for colored `ls` to work.
    - Remember to add `export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"` to `.zshrc` file.
- Do
    ```
    source .zshrc
    ```
- If substring search using arrow key up/down not working, check keystroke by `cat -v` and change it in line 54, 55.
- [Github page of zplug](https://github.com/zplug/zplug)
