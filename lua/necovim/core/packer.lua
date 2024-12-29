local packer = {}
local fn = vim.fn
local cmd = vim.api.nvim_command
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

-- this function to check and install packer package manager
function packer.check_and_install()
    if fn.empty(fn.glob(install_path)) > 0 then
        packer.bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
            install_path })
        print(packer.bootstrap)
        cmd('packadd packer.nvim')
    end
    require 'packer'.init {
        git = { clone_timeout = 300 },
        display = {
            open_fn = function()
                return require("packer.util").float { border = "single" }
            end,
        },
    }
end

-- load plugins on startup
function packer.load(users)
	require 'packer'.startup(function(use)
	        for _, item in ipairs(users) do
	            use(item)
	        end
		if packer.bootstrap then
			require 'packer'.sync()
		end
    	end)
end

-- configure packer on load
function packer.config(opt)
	if not packer.bootstrap then
	        for _, item in ipairs(opt) do
	        	item()
	        end
	end
end

return packer
