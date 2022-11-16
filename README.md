# 🎨 Paint

Simple Neovim plugin to easily add additional highlights to your buffers.

## ❓ Why?

The reason I implemented this is because of the slow performance of [tree-sitter-comment](https://github.com/stsewd/tree-sitter-comment)
in large files. **Treesitter** will inject the `comment` language for every line
comment, which is far from ideal. I've disabled the `comment` parser, but still wanted
to see `@something` highlighted in Lua comments.

## ⚡️ Requirements

- Neovim >= 0.8.0
- **Paint** only works with `colorschemes` that set highlights using `vim.api.nvim_set_hl`

## 📦 Installation

Install the plugin with your preferred package manager:

```lua
-- Packer
use({
  "folke/paint.nvim",
  config = function()
    require("paint").setup({
      ---@type PaintHighlight[]
      highlights = {
        {
          -- filter can be a table of buffer options that should match,
          -- or a function called with buf as param that should return true.
          -- The example below will paint @something in comments with Constant
          filter = { filetype = "lua" },
          pattern = "%s*%-%-%-%s*(@%w+)",
          hl = "Constant",
        },
      },
    })
  end,
})
```
