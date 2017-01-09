local conf = require "conf"
local github_issues_comments = require "includes.github_issues_comments"

local exports = {}

local function html_post(metadata, content)
  local github_comments_html = ""
  if metadata.issueid ~= nil then
    github_comments_html = github_issues_comments.html_github_issues_comments(metadata.issueid)
  end

  local post = [[
          <section class="post">
            <h1>]] .. metadata.title .. [[</h1>
  ]] .. content .. [[
          </section>
          <section class="meta">
          <span class="author">
            <a href="/">]] .. conf.author .. [[</a>
          </span>
          <span class="time">
            /
            <time datetime="]] .. metadata.date .. [[">]] .. metadata.date .. [[</time>
          </span>
          <br />
          <span class="license">
            Published under <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">(CC) BY-NC-SA</a>
          </span>
          <span class="categories">
            in categories
            <a href="/categories/#]] .. metadata.categories .. [[" title="]] .. metadata.categories .. [[">]] .. metadata.categories .. [[</a>&nbsp;
          </span>
          </section>
          ]] .. github_comments_html .. [[
          <script type="text/javascript">
          $(function(){
            $(document).keydown(function(e) {
              if (e.target.nodeName.toUpperCase() != 'BODY') return;
              var url = false;
                  if (e.which == 37 || e.which == 74) {  // Left arrow and J
                      {% if page.previous %}
                  url = '{{ site.url }}{{ page.previous.url }}';
                  {% endif %}
                  }
                  else if (e.which == 39 || e.which == 75) {  // Right arrow and K
                      {% if page.next %}
                  url = '{{ site.url }}{{ page.next.url }}';
                  {% endif %}
                  }
                  if (url) {
                      window.location = url;
                  }
            });
          })
          </script>
  ]]

  return post
end
exports.html_post = html_post

return exports
