local exports = {}

local function html_index(posts)
  local list = ''
  for k, v in ipairs(posts) do
    list = list .. [[
              <li class="listing-item">
                <time datetime="]] .. v.date .. [[">]] .. v.date .. [[</time>
                <a href="/]] .. string.lower(v.categories) .. "/" .. v.uri .. ".html" .. [[" title="]] .. v.title .. [[">]] .. v.title .. [[</a>
              </li>
    ]]
  end
  local index = [[
          <section class="post">
            <h1>Recent posts</h1>
            <ul class="listing">
  ]] .. list .. [[
            </ul>
          </section>
  ]]

  return index
end
exports.html_index = html_index

return exports
