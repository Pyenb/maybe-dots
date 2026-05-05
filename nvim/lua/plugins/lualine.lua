local dotnet_job_indicator = { require("easy-dotnet.ui-modules.jobs").lualine }

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require("lualine").setup({
      options = {
        theme = "tomorrow_night",
      },
      sections = {
        lualine_a = { "mode", dotnet_job_indicator },
      },
    })
  end,
}
