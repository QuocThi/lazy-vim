-- Thanks to Mr.BacBia3696
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { { "hrsh7th/cmp-cmdline" }, { "onsails/lspkind-nvim" } },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.cmdline = {
        [":"] = {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
          }, {
            {
              name = "cmdline",
              option = {
                ignore_cmds = { "Man", "!" },
              },
            },
          }),
        },
        ["/"] = {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = "buffer" },
          },
        },
      }

      local border_opts = {
        border = "rounded",
        winhighlight = "Normal:None,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }
      opts.window = {
        completion = cmp.config.window.bordered(border_opts),
        documentation = cmp.config.window.bordered(border_opts),
      }
      opts.formatting = {
        format = function(_, item)
          item.menu = nil
          item.kind = (require("lazyvim.config").icons.kinds[item.kind] or "") .. item.kind
          return item
        end,
      }
      opts.preselect = cmp.PreselectMode.None
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      })
    end,
  },
}
