# Package

version       = "0.1.0"
author        = "joachimschmidt557"
description   = "A web UI for a twiddl environment"
license       = "MIT"
srcDir        = "src"
bin           = @["twiddl_webui"]



# Dependencies

requires "nim >= 0.20.0"
requires "argparse >= 0.8.3"
requires "jester >= 0.4.1"
requires "nwt"
requires "https://github.com/twiddl/twiddl#master"
