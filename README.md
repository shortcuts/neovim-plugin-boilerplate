<p align="center">
  <h1 align="center">Neovim plugin boilerplate</h2>
</p>

<p align="center">
    Minimal Neovim plugin boilerplate with already configured CI, docs and tests.
</p>

## ⚡️ Features

- README.md template
- GitHub Release script
- Perfect for open-source:
  - CODEOWNERS file for PR auto-assign
  - Issues and PR templates
- CI with GitHub actions:
  - Test running on multiple Neovim version
  - Lint check on CI
  - Minimal run time, ideal for free plan
- Docs with [mini.nvim `doc` plugin](https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/doc.lua)
- Tests with [mini.nvim `test` plugin](https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/test.lua)
- Linting with [Stylua](https://github.com/JohnnyMorganz/StyLua)
- Changelog with [git-chglog](https://github.com/git-chglog/git-chglog)

## 📋 Installation

> **Note**:
> This section is only required if you wish to setup the same linter and changelog generator as I do.

- [Install Stylua linter](https://github.com/JohnnyMorganz/StyLua#installation)
- [Install git-chglog generator](https://github.com/git-chglog/git-chglog)

## ☄ Usage

The following checklist is all your need to do to start writing your first plugin.

### 1 - Clone the repository where you'd like your plugin to live

```sh
# via HTTPs
git clone https://github.com/shortcuts/neovim-plugin-boilerplate.git ~/my-awesome-plugin.nvim

# via SSH
git clone git@github.com:shortcuts/neovim-plugin-boilerplate.git ~/my-awesome-plugin.nvim

```

### 2 - Replace placeholder names with your plugin name

> **Note**:
> The placeholder names are purposely written with different casing. Make sure to keep it.

#### File names

```sh
mv plugin/your-plugin-name.lua plugin/my-awesome-plugin.lua
mv lua/your-plugin-name lua/my-awesome-plugin
mv README_TEMPLATE.md README.md 

```

#### Search and replace placeholder occurrences:

> Below actions are Neovim commands

```vim
:vimgrep /YourPluginName/ **/*
:cfdo %s/YourPluginName/MyAwesomePlugin/g | update

:vimgrep /your-plugin-name/ **/* .github/**
:cfdo %s/your-plugin-name/my-awesome-plugin/g | update

:vimgrep /YOUR_GITHUB_NAME/ .chglog/** .github/** **/*.md
:cfdo %s/YOUR_GITHUB_NAME/shortcuts/g | update

:vimgrep /YOUR_REPOSITORY_NAME/ .chglog/** **/*.md
:cfdo %s/YOUR_REPOSITORY_NAME/my-awesome-plugin.nvim/g | update
```

### 3 - Code

You can now start writing your plugin, make sure the following commands work:
1. `make deps` to install docs/tests dependencies
2. `make lint` to format the code
3. `make documentation` to generate the documentation
4. `make test` to run the tests

Enjoy!

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.
