return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      ts_ls = {},
      eslint = {},
      tailwindcss = {},
      omnisharp = {
        cmd = { "omnisharp" },
        enable_editorconfig_support = true,
        enable_ms_build_load_projects_on_demand = false,
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
        sdk_include_prereleases = true,
        analyze_open_documents_only = false,
      },
    }
  },
  config = function(_, opts)
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = vim.tbl_keys(opts.servers),
    })

    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end
}
