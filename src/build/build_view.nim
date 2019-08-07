import os, htmlgen, ropes

import twiddl

proc buildBuildView*(env:TwiddlEnv, b:Build):string =
  const
    header = slurp("common-header.html")
    footer = slurp("common-footer.html")
  var result = rope()

  result.add(header)
  result.addf(h1("Build $1"), [rope(b.id)])
  result.addf("Current status: $1 \n", [rope($b.status)])

  result.add(h1("Logs"))
  if b.logs.len < 1:
    result.add("No logs produced.\n")
  for log in b.logs:
    result.add(pre(readFile(log.path)))

  result.add(h1("Artifacts"))
  if b.artifacts.len < 1:
    result.add("No artifacts produced.\n")

  result.add(footer)

  return $result
