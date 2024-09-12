-- return {
--   "nvim-java/nvim-java",
--   config = false,
--   dependencies = {
--     {
--       "neovim/nvim-lspconfig",
--       opts = {
--         servers = {
--           jdtls = {
--             -- Your custom jdtls settings goes here
--           },
--         },
--         setup = {
--           jdtls = function()
--             require("java").setup({
--               -- Your custom nvim-java configuration goes here
--             })
--           end,
--         },
--       },
--     },
--   },
-- }

return {
  "nvim-java/nvim-java",
  config = false,
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            settings = {
              java = {
                inlayHints = {
                  parameterNames = {
                    enabled = "none", -- Disable parameter name inlay hints
                  },
                },
              },
            },
          },
        },
        setup = {
          jdtls = function()
            require("java").setup({
              -- Your custom nvim-java configuration goes here
            })
          end,
        },
      },
    },
  },
}
