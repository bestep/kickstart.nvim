return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'bestepOS',
        path = '~/Obsidian/bestepOS',
      },
    },

    -- see below for full list of options 👇
  },

  -- completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },

  mappings = {
    ['gf'] = {
      action = function()
        return require('obsidian').util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check boxes
    --    ['<leader>ch'] = {
    --      action = function()
    --        return require('obsidian').util.toggle_checkbox()
    --      end,
    --      opts = { buffer = true },
    --    },
    -- Smart action depending on context, either follow link or toggle checkbox.
    --    ['<cr>'] = {
    --      action = function()
    --        return require('obsidian').util.smart_action()
    --      end,
    --      opts = { buffer = true, expr = true },
  },
  ui = {
    -- Disable some things below here because I set these manually for all Markdown files using treesitter
    checkboxes = {},
    bullets = {},
  },
}
