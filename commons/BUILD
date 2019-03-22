load(
    "@rules_scala_annex//rules:scala.bzl",
    "scala_library",
)

scala_library(
  name = "commons",
  srcs = glob(["src/main/**/*.scala", "src/main/**/*.java"]),
  deps = [
    "//3rdparty/jvm/com/google/guava:guava",
  ],
  visibility = ["//visibility:public"],
)