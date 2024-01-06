local M = {}
function M.lsp.on_attach(client, opts)
  -- Disable function argument auto-fill
  client.resolved_capabilities.signature_help = false
  -- Your other attachment logic here
end

return M
