require("crates").setup {
  completion = {
    cmp = {
      enabled = true,
    },
  },
}
require("cmp").setup.buffer {
  sources = { { name = "crates" } },
}
