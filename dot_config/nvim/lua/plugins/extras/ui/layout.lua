local super = require("lazyvimx.extras.ui.layout")

table.remove(super, 1)

super[2].opts.layouts[2].elements[1].size = 0.5

table.insert(super[2].opts.layouts[2].elements, { id = "console", size = 0.5 })

return super
