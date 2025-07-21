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
        ensure_installed = { "clangd", "pyright", "tinymist", "rust-analyzer" }
      })

      -- Automatic server setup from the mason-lspconfig docs
      mason_lspconfig.setup_handlers({
        function (server_name)
          if server_name == "tinymist" then
            require("lspconfig")["tinymist"].setup({
              settings = {
                formatterMode = "typstyle",
                exportPdf = "onType",
                semanticTokens = "disable"
              }
            })
          else
              require("lspconfig")[server_name].setup({
                capabilities = require("blink.cmp").get_lsp_capabilities()
              })
          end
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
  },
    {
      'chomosuke/typst-preview.nvim',
      lazy = false, -- or ft = 'typst'
      version = '1.*',
      opts = {}, -- lazy.nvim will implicitly calls `setup {}`
    }
}
