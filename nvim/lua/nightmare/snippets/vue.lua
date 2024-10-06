local luasnip = require('luasnip')
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node

return {
  s('vcc', {
    t({"<script lang=\"ts\" setup>", ""}),
    i(3),
    t({"\t", "</script>"}),

    t({"\t", "\t", "<template>", ""}),
    i(1),
    t({'\t',"</template>"}),

    t({"\t", "\t", "<style lang=\"scss\" scoped>", ""}),
    i(2),
    t({"\t", "</style>"}),
  })
}
