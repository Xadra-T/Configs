-- This plugin automatically inserts matching pairs of characters when typing the opening character.
return {
    'windwp/nvim-autopairs', -- Github repo
    event = 'InsertEnter', -- Lazy-loading directive that tells the plugin to only load when we enter insert mode, which improves startup time
    config = true, -- Use the default configuration without any customization
  }

--[[
This plugin can be configured to work with other plugins like completion engines, like nvim-cmp.
By default, these two plugins might conflict. For example:
    You type an opening bracket (
    Autopairs adds the closing ) automatically
    You select a completion item that already includes a closing bracket
    You end up with duplicate closing brackets ))

With proper configuration, nvim-autopairs can detect when a completion is being inserted and adjust its behavior accordingly, preventing duplicate brackets. This would require additional setup like:
  local npairs = require('nvim-autopairs')
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  local cmp = require('cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
]]