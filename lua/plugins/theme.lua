return {
 "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd [[
      let g:gruvbox_contrast_dark = 'hard'
      let g:gruvbox_contrast_light = 'hard'
      let g:gruvbox_italic = 1
      let g:gruvbox_bold = 1
      let g:italic_comments = 1
      let g:italic_operator = 1
      let g:italic_emphasis = 1
      let g:gruvbox_emphasis = 'bold'
      colorscheme gruvbox
      ]]
    end
}
