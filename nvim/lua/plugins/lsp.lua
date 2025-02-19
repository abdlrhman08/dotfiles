return {
  { "neovim/nvim-lspconfig" },
  { 
    "saghen/blink.cmp",
    version = "*",
    opts = {
      sources = {
        default = {"lsp", "path", "buffer"}
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local mason = require("mason")
      mason.setup({})

      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = { "clangd", "pyright" }
      })

      -- Automatic server setup from the mason-lspconfig docs
      mason_lspconfig.setup_handlers({
        function (server_name)
          require("lspconfig")[server_name].setup({
            capabilities = require("blink.cmp").get_lsp_capabilities()
          })
        end
      })
    end
  },
  { 
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "cpp", "c", "rust", "python" },
	auto_install = true,
	highlight = {
	  enable = true
	},
	indent = {
	  enable = true
	}
      })
    end 
  }
}
