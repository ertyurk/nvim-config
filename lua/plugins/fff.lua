return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  lazy = false,
  opts = {
    prompt = " ",
    title = "Files",
    max_results = 100,
    layout = {
      height = 0.85,
      width = 0.9,
      prompt_position = "bottom",
      preview_position = "right",
      preview_size = 0.55,
      path_shorten_strategy = "middle_number",
    },
    preview = {
      line_numbers = true,
      wrap_lines = false,
    },
    hl = {
      border = "FFFBorder",
      normal = "FFFNormal",
      title = "FFFTitle",
      prompt = "FFFPrompt",
      matched = "FFFMatched",
      cursor = "FFFCursor",
      frecency = "FFFFrecency",
      directory_path = "FFFDirPath",
      scrollbar = "FFFScrollbar",
      combo_header = "FFFCombo",
      grep_match = "FFFMatched",
      grep_line_number = "FFFLineNr",
      grep_regex_active = "FFFGrepRegex",
      grep_plain_active = "FFFGrepPlain",
      grep_fuzzy_active = "FFFGrepFuzzy",
      suggestion_header = "FFFSuggest",
    },
  },
  config = function(_, opts)
    require("fff").setup(opts)

    local hl = vim.api.nvim_set_hl
    -- gruvbox hard palette
    local bg0_h  = "#1d2021"
    local bg1    = "#3c3836"
    local bg2    = "#504945"
    local fg1    = "#ebdbb2"
    local fg4    = "#a89984"
    local red    = "#fb4934"
    local green  = "#b8bb26"
    local yellow = "#fabd2f"
    local blue   = "#83a598"
    local purple = "#d3869b"
    local aqua   = "#8ec07c"
    local orange = "#fe8019"
    local gray   = "#928374"

    local set = function(name, opts_)
      opts_.default = false
      hl(0, name, opts_)
    end

    set("FFFBorder",      { fg = fg4,    bg = bg0_h })
    set("FFFNormal",      { fg = fg1,    bg = bg0_h })
    set("FFFTitle",       { fg = fg4,    bg = bg0_h, bold = true })
    set("FFFPrompt",      { fg = orange, bg = bg0_h, bold = true })
    set("FFFMatched",     { fg = bg0_h,  bg = orange, bold = true })
    set("FFFCursor",      { bg = bg2 })
    set("FFFFrecency",    { fg = purple, italic = true })
    set("FFFDirPath",     { fg = gray,   italic = true })
    set("FFFScrollbar",   { fg = bg2 })
    set("FFFCombo",       { fg = aqua,   bold = true })
    set("FFFLineNr",      { fg = gray })
    set("FFFGrepRegex",   { fg = blue,   bold = true })
    set("FFFGrepPlain",   { fg = gray })
    set("FFFGrepFuzzy",   { fg = aqua,   bold = true })
    set("FFFSuggest",     { fg = yellow, italic = true })

    -- reapply on colorscheme change so gruvbox reloads dont nuke them
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.schedule(function()
          require("fff.conf").get() -- ensure init
        end)
      end,
    })
  end,
  keys = {
    { "<leader>ff", function() require("fff").find_files() end, desc = "Find files (fff)" },
    {
      "<leader>fg",
      function()
        require("fff").live_grep({
          title = "Grep",
          prompt = " ",
        })
      end,
      desc = "Live grep (fff)",
    },
  },
}
