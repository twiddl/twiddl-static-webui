import os, htmlgen, ropes, options, times

import twiddl

proc buildBuildView*(env:TwiddlEnv, b:Build): string =
  const
    header = slurp("common-header.html")
    footer = slurp("common-footer.html")
  var result = rope()

  result.add(header)
  result.addf(h1("Build $1"), [b.id.rope])
  result.addf("Current status: $1 \n", [b.status.statusHumanReadable.rope])

  if b.timeStarted.isSome:
    result.addf("Time started: $1 ", [($b.timeStarted.get).rope])
    if b.timeFinished.isSome:
      result.addf("Time finished: $1 ", [($b.timeFinished.get).rope])
      result.addf("Duration: $1 ", [($(b.timeFinished.get - b.timeStarted.get)).rope])

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
