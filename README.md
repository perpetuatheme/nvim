<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/perpetuatheme/perpetua/main/logo/logo_circle_dark.png">
        <source media="(prefers-color-scheme: light)" srcset="https://raw.githubusercontent.com/perpetuatheme/perpetua/main/logo/logo_circle_light.png">
        <img alt="The Perpetua logo, a waning crescent flipped across the x-axis, with half a sun on the inside" width="100" src="https://raw.githubusercontent.com/perpetuatheme/perpetua/main/logo/logo_circle_light.png">
    </picture>
    <h1 align="center">Perpetua for <a href="https://github.com/neovim/neovim">Neovim</a></h1>
</p>

<p align="center">
    A Neovim theme with support for native LSP, Treesitter, Lualine, and more!
</p>

<p align="center">
    <picture>
        <source media="(prefers-color-scheme: dark)" srcset="./assets/screenshot-dark.png">
        <source media="(prefers-color-scheme: light)" srcset="./assets/screenshot-light.png">
        <img alt="A screenshot of the Neovim text editor with the Perpetua theme applied" width="600" src="./assets/screenshot-light.png">
    </picture>
</p>

> [!WARNING]
> The project is under active development. Things are subject to change.

## Installation

Use your favorite plugin manager.

**[lazy.nvim](https://github.com/folke/lazy.nvim)**

```lua
{ 'perpetuatheme/nvim', name = 'perpetua' }
```

**[mini.deps](https://github.com/echasnovski/mini.deps)**

```lua
MiniDeps.add({ source = 'perpetuatheme/nvim', name = 'perpetua' })
```

**[paq-nvim](https://github.com/savq/paq-nvim)**

```lua
{ 'perpetuatheme/nvim', as = 'perpetua' }
```

**[pckr.nvim](https://github.com/lewis6991/pckr.nvim)**

```lua
{ 'perpetuatheme/nvim' } -- custom name not supported yet
```

## Usage

Choose the desired ambience and apply it using your preferred configuration
language.

**VimL**

```vim
colorscheme perpetua " defaults to perpetua-dark
colorscheme perpetua-light
colorscheme perpetua-dark
```

**Lua**

```lua
vim.cmd.colorscheme('perpetua') -- defaults to perpetua-dark
vim.cmd.colorscheme('perpetua-light')
vim.cmd.colorscheme('perpetua-dark')
```

## Screenshots

<details>
    <summary>Light</summary>
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a C source file, with the Perpetua theme applied in light ambience mode" src="./assets/screenshot-c-light.png">
        <figcaption>Perpetua light ambience on Neovim editing a C source file.</figcaption>
    </figure>
    <br>&nbsp;
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a Go source file, with the Perpetua theme applied in light ambience mode" src="./assets/screenshot-go-light.png">
        <figcaption>Perpetua light ambience on Neovim editing a Go source file.</figcaption>
    </figure>
    <br>&nbsp;
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a Lua source file, with the Perpetua theme applied in light ambience mode" src="./assets/screenshot-lua-light.png">
        <figcaption>Perpetua light ambience on Neovim editing a Lua source file.</figcaption>
    </figure>
    <br>&nbsp;
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a Nix source file, with the Perpetua theme applied in light ambience mode" src="./assets/screenshot-nix-light.png">
        <figcaption>Perpetua light ambience on Neovim editing a Nix source file.</figcaption>
    </figure>
</details>

<details>
    <summary>Dark</summary>
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a C source file, with the Perpetua theme applied in dark ambience mode" src="./assets/screenshot-c-dark.png">
        <figcaption>Perpetua dark ambience on Neovim editing a C source file.</figcaption>
    </figure>
    <br>&nbsp;
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a Go source file, with the Perpetua theme applied in dark ambience mode" src="./assets/screenshot-go-dark.png">
        <figcaption>Perpetua dark ambience on Neovim editing a Go source file.</figcaption>
    </figure>
    <br>&nbsp;
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a Lua source file, with the Perpetua theme applied in dark ambience mode" src="./assets/screenshot-lua-dark.png">
        <figcaption>Perpetua dark ambience on Neovim editing a Lua source file.</figcaption>
    </figure>
    <br>&nbsp;
    <figure>
        <img alt="A screenshot of the Neovim text editor showing a Nix source file, with the Perpetua theme applied in dark ambience mode" src="./assets/screenshot-nix-dark.png">
        <figcaption>Perpetua dark ambience on Neovim editing a Nix source file.</figcaption>
    </figure>
</details>

<br>&nbsp;
<hr>
<p align="center">
    <small>© Copyright 2023–present, The Perpetua Authors.</small>
</p>
