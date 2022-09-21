local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup{
  capabilities = capabilities,
  on_attach = function()
    -- Set K to lsp hover function in normal mode for current buffer.
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = 0 })
    vim.keymap.set("n", "gd", '<cmd>Lspsaga preview_definition<CR>', { buffer = 0 })
    vim.keymap.set("n", "<C-j>", '<cmd>Lspsaga diagnostic_jump_next<CR>', { buffer = 0 })
    vim.keymap.set("n", "<C-k>", '<cmd>Lspsaga diagnostic_jump_prev<CR>', { buffer = 0 })
  end,
}

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities,
  on_attach = function()
    -- Set K to lsp hover function in normal mode for current buffer.
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
  end,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
       vim.lsp.diagnostic.on_publish_diagnostics, {
         underline = true,
         virtual_text = false,
         signs = true
       }
     )

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


-- [[ Setup nvim-cmp ]]
vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
sources = cmp.config.sources({
  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
}, {
  { name = 'buffer' },
})
})
