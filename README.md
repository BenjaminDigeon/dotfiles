# Dotfiles

Clone this repo in any folder, and then run the config scripts.

## Configure MacOS

```bash
./configure_osx.sh
```

## Configure bash profile, prompts, etc ...

Link dotfiles to `~`

```bash
./configure_dotfiles.sh
```

## Install osx deps (brew...)

```bash
./install_deps.sh
```

## Install brew formulas

```bash
./install_brew_formulas.sh
```

## Configure global gitignore

```bash
git config --global core.excludesfile ~/.gitignore_global
```