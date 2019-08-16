import os

import argparse
import jester
import nwt

import twiddl

when isMainModule:
  var p = newParser("twiddl_webui"):
    help("A web UI for a twiddl environment")
  let opts = p.parse()

  var templates = newNwt("templates/*.html")

  routes:
    get "/":
      resp templates.renderTemplate("index.html")

    get "/builds":
      resp templates.renderTemplate("builds.html")

    get "/statistics":
      resp templates.renderTemplate("statistics.html")

    get "/builds/@build":
      resp ""

    get "/builds/@build/logs/@id":
      resp ""

    get "/builds/@build/artifacts/@id":
      resp ""
