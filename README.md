<p align="center">
  <h1 align="center">🔌  Neovim plugin boilerplate</h2>
</p>

<p align="center">
    Plug and play Neovim plugin boilerplate with pre-configured CI, CD, linter, docs and tests.
</p>

## ⚡️ Features

- Interactive `setup` script for an easy setup
- Perfect for open-source:
  - CODEOWNERS file for PR auto-assign
  - Issue forms and PR templates
  - README.md template
- Generated Neovim documentation with [mini.nvim `doc` plugin](https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/doc.lua)
- Test runner with [mini.nvim `test` plugin](https://github.com/echasnovski/mini.nvim/blob/main/lua/mini/test.lua)
    - Versioned testing with available with [`bob`](https://github.com/MordechaiHadad/bob)
- Automatic releases (CD) with [release-please-action](https://github.com/google-github-actions/release-please-action)
- Linting with [Stylua](https://github.com/JohnnyMorganz/StyLua)
- Static analysis with LuaLS (inspired by [lukas-reineke/ci-template.nvim](https://github.com/lukas-reineke/ci-template.nvim))
- GitHub Actions Pipeline:
  - Lint with [Stylua](https://github.com/JohnnyMorganz/StyLua)
  - Static analysis with LuaLS
  - Versioned testing (0.9.x, 0.10.x and Nightly by default)
  - Generated documentation analysis
  - Minimal run time with caching capabilities, ideal for free-plans

## 📋 Installation

> **Note**:
> This section is only required if you wish to use the tooling proposed by this template, you can skip this step if you want.

- [Install Stylua for the linting solution](https://github.com/JohnnyMorganz/StyLua#installation)
- [Install `bob` neovim version manager for the versioned testing solution](https://github.com/MordechaiHadad/bob)

## ☄ Getting started

The following checklist is all your need to do to start writing your first plugin.

### 1 - Clone the template repository

#### via HTTPs

```sh
git clone https://github.com/shortcuts/neovim-plugin-boilerplate.git ~/my-awesome-plugin.nvim
```

#### via SSH

```sh
git clone git@github.com:shortcuts/neovim-plugin-boilerplate.git ~/my-awesome-plugin.nvim
```

#### via GH
```sh
gh repo create my-awesome-plugin --template shortcuts/neovim-plugin-boilerplate --public --clone
```

### 2 - Replace placeholder names with your plugin name

#### ✨ Automatically

The [setup script](https://github.com/shortcuts/neovim-plugin-boilerplate/blob/main/scripts/setup.sh) will rename files and placeholder names for you. Once done, you can remove anything `setup` related if you want to.

```sh
# interactive
make setup

# automated
USERNAME=my-github-username PLUGIN_NAME=my-awesome-plugin REPOSITORY_NAME=my-awesome-plugin.nvim make setup
```

#### ✍️ Manually

> **Note**:
> The placeholder names are purposely written with different casing. Make sure to keep it.

##### File names

```sh
rm -rf doc
mv plugin/your-plugin-name.lua plugin/my-awesome-plugin.lua
mv lua/your-plugin-name lua/my-awesome-plugin
mv README_TEMPLATE.md README.md 
mv .github/ISSUE_TEMPLATE/Bug_report_template.yml .github/ISSUE_TEMPLATE/Bug_report.yml

```

##### Search and replace placeholder occurrences:

```vim
:vimgrep /YourPluginName/ **/*
:cfdo %s/YourPluginName/MyAwesomePlugin/g | update

:vimgrep /your-plugin-name/ **/* .github/**
:cfdo %s/your-plugin-name/my-awesome-plugin/g | update

:vimgrep /YOUR_GITHUB_USERNAME/ .github/** **/*.md
:cfdo %s/YOUR_GITHUB_USERNAME/shortcuts/g | update

:vimgrep /YOUR_REPOSITORY_NAME/ **/*.md
:cfdo %s/YOUR_REPOSITORY_NAME/my-awesome-plugin.nvim/g | update
```

### 3 - Code

You can now start writing your plugin, make sure the following commands work:
1. `make deps` to install docs/tests dependencies
2. `make lint` to format the code
3. `make documentation` to generate the documentation
4. `make test` to run the tests

Enjoy!

## ☄ Who uses this template?

- [no-neck-pain.nvim](https://github.com/shortcuts/no-neck-pain.nvim): ☕ Dead simple yet super extensible plugin to center the currently focused buffer to the middle of the screen.
- [wf.nvim](https://github.com/Cassin01/wf.nvim): A modern which-key for neovim
- [better-ts-errors.nvim](https://github.com/OlegGulevskyy/better-ts-errors.nvim)

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.
