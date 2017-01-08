local exports = {}

local function html_page(metadata, content)
  local page = [[
          <section class="post">
            <h1>]] .. metadata.title .. [[</h1>
  ]] .. content .. [[
          </section>
  ]]

  return page
end
exports.html_page = html_page

return exports
