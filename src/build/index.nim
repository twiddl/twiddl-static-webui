import htmlgen, ropes

import twiddl

proc buildIndex*(env:TwiddlEnv): string =
  const
    header = slurp("common-header.html")
    footer = slurp("common-footer.html")
  var result = rope()
  result.add(header)

  result.add(h1("Latest build"))
  if env.builds.len > 0:
    let latestBuild = env.builds[env.builds.high]
    result.addf(p("Build id: $1 "), [latestBuild.id.rope])
    result.addf(p("Status: $1 "), [latestBuild.status.statusHumanReadable.rope])
  else:
    result.add("No builds yet!\n")

  result.add(h1("Latest builds"))
  if env.builds.len > 0:
    for build in env.builds:
      discard
  else:
    result.add("No builds yet!\n")

  result.add(footer)
  return $result
