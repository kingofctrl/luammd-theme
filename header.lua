local conf = require "conf"

local path_util = require "utils.path_util"

local exports = {}

local pages = path_util.read_pages_folder()

local function html_header()
  local nav = [[
              <li>
                <span><a title="home page" class="" href="/">home</a></span>
              </li>
  ]]
  for k, v in pairs(pages) do
    nav = nav .. [[
              <li>
                <span><a title="]] .. string.sub(v, 1, -4) .. [[" class="" href="/]] .. string.sub(v, 1, -4) .. [[/">]] .. string.sub(v, 1, -4) .. [[</a></span>

              </li>
    ]]
  end

  --nav = nav .. [[
            --<li>
              --<span><a title="subscribe by RSS" class="" href="/feed/">subscribe</a></span>
            --</li>
  --]]


  local header = [[
<!DOCTYPE html>
<html>
  <head>
    <!-- MathJax -->
    <script type="text/javascript"
      src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
    </script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <title>
    ]] .. conf.title .. [[
    </title>

    <link rel="stylesheet" href="/stylesheets/reset.css">
    <link rel="stylesheet" href="/stylesheets/styles.css">
    <link rel="stylesheet" href="/stylesheets/pygment_trac.css">
    <script type="text/javascript" src="/js/jquery-2.1.1.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <!--[if lt IE 9]>
    <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="wrapper">
      <div>
        <header>
          <h1 class="header"><a href="/">]] .. conf.title .. [[</a></h1>
          <p class="header">
          ]] .. conf.subtitle .. [[
            
          </p>
          <br>
          <p class="header">
            Email: <br />
            ]] .. conf.email .. [[
            <br>
            <a class="header name" href="]] .. conf.linkedin .. [[">Linkedin</a>
            <a class="header name" href="https://github.com/]] .. conf.github .. [[">GitHub</a>
          </p>
          <ul>
  ]] .. nav .. [[
          </ul>
        </header>
      </div>
      <div>
        <article class="content">
  ]]

  return header
end
exports.html_header = html_header

return exports
