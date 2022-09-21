vim.cmd[[filetype plugin on]]
require('impatient')

-- [[ IMPORTS ]]
require('jittery.opts')
require('jittery.plugs')
require('jittery.keys')

-- [[ PLUGINS ]]
require('nvim-tree').setup{}
require('nvim-autopairs').setup{}
require('gitsigns').setup{}
require('alpha').setup(require('alpha.themes.dashboard').config)

