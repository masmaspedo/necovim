local M = {} local packer = require'necovim.core.packer'
local core_plugins = require'necovim.plugins'
local plugins_repo = {}

M.collect_plugins = function(plugins)
    -- append users plugins
    for _, item in ipairs(plugins) do
        table.insert(plugins_repo, item)
    end
end

M.loaded_plugins = function()
    return #plugins_repo
end


M.setup = function(cfg)
    -- install packer
    packer.check_and_install()
    M.collect_plugins(core_plugins)
    M.collect_plugins(cfg.plugins)
    packer.load(plugins_repo)
    packer.config(require'necovim.plugins.load')

    -- initialize configuration
    require'necovim.core.config'.init(packer, cfg)
    require'necovim.keybind'.bind(cfg)
end

return M
