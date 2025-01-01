-- luasnip.lua

local ls = require("luasnip")
local snip = ls.snippet
local tNode = ls.text_node
local iNode = ls.insert_node

-- ========================================================
-- C++ snippets
-- ========================================================

-- C++
-- std::cout snippet
ls.add_snippets("cpp", {
    snip("co", {
        tNode('std::cout << '),
        iNode(1),
        tNode(' << std::endl;'),
    })
})

-- C++
-- Define a C++ class snippet
--  TODO: add auto match for class name typing and default
--        constructor / de-constructor
ls.add_snippets("cpp", {
    snip("clas", {
        tNode({
            "#pragma once",
            "",
            "/*",
            " TODO: Add class description",
            "*/",
            "class "
        }),
        iNode(1), -- Class name
        tNode("{"),
        tNode({"", "", "public:", "//", "// Constructors"}),
        --iNode(1), -- Class name
        tNode({"", "", "//", "// Getters / Setters"}),
        iNode(2), -- Public methods/variables
        tNode({"", "", "private:"}),
        iNode(3), -- Private methods/variables
        tNode({"", "};"}),
    })
})

