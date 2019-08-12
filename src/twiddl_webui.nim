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
