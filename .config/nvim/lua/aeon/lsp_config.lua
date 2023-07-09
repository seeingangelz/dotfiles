local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "lua_ls",
                       "clangd",
                      "pyright",
                        "gopls",
                        "cssls",
                         "html",
                       "bashls"
                       }
})

lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.gopls.setup {}
lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.bashls.setup {}
