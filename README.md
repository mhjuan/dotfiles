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

### 3. Change default shell to `zsh`
```
chsh -s zsh
```

### 4. Install `zplug`
```
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```
- [Github page of zplug](https://github.com/zplug/zplug)

### 5. Clone dotfiles to home directory

### 6. Load `zsh` plugins and shell settings
```
source .zshrc
```
