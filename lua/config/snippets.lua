local ls = require 'luasnip'

-- some shorthands
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function()
  return { os.date '%Y-%m-%d' }
end

local long_date = function()
  return { os.date '%Y-%m-%dT%H:%M:%S%z' }
end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = 'date',
      namr = 'Date',
      dscr = 'Date in the form of YYYY-MM-DD',
    }, {
      func(date, {}),
    }),
  },
  markdown = {
    snip({
      trig = 'xds',
      namr = 'Date',
      dscr = 'Date in the form of YYY-MM-DD',
    }, {
      func(date, {}),
    }),
    snip({
      trig = 'xdts',
      namr = 'Long Date',
      dscr = 'Date in the form of yyyy-MM-ddTHH:mm:ssZ',
    }, {
      func(long_date, {}),
    }),
    snip({
      trig = 'yamlcr',
      namr = 'yaml Clubreading',
      dscr = 'YAML header for CR post',
    }, {
      text { '---', 'title: ' },
      insert(1, "'note_title'"),
      text { '', "author: 'William Estep'" },
      text { '', "date: '" },
      func(long_date, {}),
      text { "'" },
      text { '', 'categories: ' },
      text { ' ', '  - ClubReading' },
      text { '', 'tags: ' },
      text { '', '  - review', '  - book', '---', '' },
      insert(0),
    }),
    snip({
      trig = 'yamlmprp',
      namr = 'yaml MPRP',
      dscr = 'YAML header for MPRP',
    }, {
      text { '---', 'title: ' },
      insert(1, "'note_title'"),
      text { '', "author: 'William Estep'" },
      text { '', "date: '" },
      func(long_date, {}),
      text { "'" },
      text { '', 'draft: true' },
      text { '', 'categories: ' },
      text { '', '  - MPRP' },
      text { '', 'tags: ' },
      text { '', '  - podcast', '  - poetry', '---' },
      insert(0),
    }),
    snip({
      trig = 'img',
      namr = 'Hugo img tag',
      dscr = 'Hugo img tag',
    }, {
      text {
        '{{< image src="images/image-placeholder.png" caption="" alt="alter-text" height="" width="" position="center" command="fill" option="q100" class="img-fluid" title="image title"  webp="false" >}}',
      },
    }),
  },
})
