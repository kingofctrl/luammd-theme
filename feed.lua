local markdown = require "discount"

local post_util = require "utils.post_util"
local path_util = require "utils.path_util"
local markdown_util = require "utils.markdown_util"

local exports = {}

local function html_feed()
  local posts = path_util.read_posts_folder()
  
  local item = ''

  for k, v in pairs(posts) do
    local contents = post_util.read_post_file(v)
    local metadata, content = markdown_util.parse(contents)
    metadata.date = string.sub(v, 1, 10)
    item = item .. [[
    <item>
      <title>]] .. metadata.title .. [[</title>
      <link>]] .. metadata.uri .. [[</link>
      <pubDate>]] .. metadata.date .. [[</pubDate>
      <author>{{ site.author }}</author>
      <guid>{{ site.url }}{{ post.id }}</guid>
      <content:encoded>]] .. markdown(content) .. [[</content:encoded>
    </item>
    ]]
  end





  local feed = [[
<?xml version="1.0" encoding="utf-8"?>
<rss version="2.0"
        xmlns:content="http://purl.org/rss/1.0/modules/content/"
        xmlns:atom="http://www.w3.org/2005/Atom"
  >
  <channel>
    <title>hmybmny</title>
    <atom:link href="/feed/" rel="self" type="application/rss+xml" />
    <link>http://hmybmny.com</link>
    <lastBuildDate>{{ site.time | date_to_xmlschema }}</lastBuildDate>
    <webMaster>hmybmny@gmail.com</webMaster>
    ]] .. item .. [[
  </channel>
</rss>
  ]]

  return feed
end
exports.html_feed = html_feed

return exports
