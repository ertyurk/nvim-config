return {
 "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd [[
      let g:gruvbox_contrast_dark = 'hard'
      let g:gruvbox_contrast_light = 'hard'
      let g:gruvbox_italic = 1
      colorscheme gruvbox
      ]]
    end
}
