local mason_registry = require "mason-registry"
local codelldb = mason_registry.get_package "codelldb"
local extension_path = codelldb:get_install_path() .. "/extension/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
local cfg = require "rustaceanvim.config"

vim.g.rustaceanvim = {
  dap = {
    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  },

  default_settings = {
    -- rust-analyzer language server configuration
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
