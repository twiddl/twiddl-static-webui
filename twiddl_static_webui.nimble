# Package

version       = "0.1.0"
author        = "joachimschmidt557"
description   = "Generate static HTML for exploring a twiddl environment"
license       = "MIT"
srcDir        = "src"
bin           = @["twiddl_static_webui"]



# Dependencies

requires "nim >= 0.20.0"
requires "argparse >= 0.7.1"
requires "https://github.com/twiddl/twiddl#master"
