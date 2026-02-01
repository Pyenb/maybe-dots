return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.1",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").load_extension("ui-select");
  end
}
