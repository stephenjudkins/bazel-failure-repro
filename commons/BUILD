load(
    "@rules_scala_annex//rules:scala.bzl",
    "scala_library",
)

scala_library(
  name = "commons",
  srcs = glob(["src/main/**/*.scala"]),
  deps = [
    "//3rdparty/jvm/com/chuusai:shapeless",
  ]
)