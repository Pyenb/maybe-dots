return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  lazy = false,

  version = "1.*",

  opts = {
    keymap = {
      preset = "default",

      ["<CR>"] = { 'select_and_accept', 'fallback' },
      ["<C><leader>"] = { "show" },
    },

    appearance = {
      nerd_font_variant = "mono"
    },

    completion = { documentation = { auto_show = true } },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        ["easy-dotnet"] = {
          name = "easy-dotnet",
          enabled = true,
          module = "easy-dotnet.completion.blink",
          score_offset = 10000,
          async = true,
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}
