-- luasnip.lua

local ls = require("luasnip")
local snip = ls.snippet
local tNode = ls.text_node
local iNode = ls.insert_node

-- ========================================================
-- C++ snippets
-- ========================================================

-- std::cout snippet
ls.add_snippets("cpp", {
    snip("co", {
        tNode('std::cout << '),
        iNode(1),
        tNode(' << std::endl;'),
    })
})

-- -- class snippet
-- ls.add_snippets("cpp", {
--     snip("class", {
--         tNode('class className\n{\npublic:\nclassName() {}\nprivate:\n};')
--     })
-- })


