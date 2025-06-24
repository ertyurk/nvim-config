return {
    {
        "numToStr/Comment.nvim",
        opts = {
            -- These are the default mappings, making them explicit
            mappings = {
                basic = true,     -- gcc, gbc
                extra = true,     -- gco, gcO, gcA
                extended = false, -- g>, g<, g>[count]{motion}, g<[count]{motion}
            },
        },
        lazy = false,
    },
}
