import os

import argparse

import twiddl

import build/index
import build/statistics
import build/build_view
import build/list_view

proc build(twiddlPath:string, outputPath:string) =
  let
    tw = openTwiddlEnv(twiddlPath)

  createDir(outputPath)

  writeFile(outputPath / "index.html", buildIndex(tw))
  writeFile(outputPath / "list.html", buildListView(tw))
  writeFile(outputPath / "statistics.html", buildStatistics(tw))
  for build in tw.builds:
    writeFile(outputPath / "builds" / $build.id & ".html", buildBuildView(build))

when isMainModule:
  var p = newParser("twiddl_static_webui"):
    option("--path", help="Path of the twiddl environment", default=".")
    option("--output", help="Output path", default=".")
  let opts = p.parse()
  build(opts.path, opts.output)
