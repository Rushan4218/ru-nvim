return {
  {
    "saghen/blink.cmp",
    version = "1.*",

    opts = {
      sources = {
        default = { "lsp" }
      },
      completion = {
        trigger = {
          show_on_trigger_character = true
        },
        documentation = {
          auto_show = true,
        }
      }
    }
  },
}
