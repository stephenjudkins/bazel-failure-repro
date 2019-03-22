load(
    "@rules_scala_annex//rules:scala.bzl",
    "configure_bootstrap_scala",
    "configure_zinc_scala",
    "scala_library",
)

load("@rules_scala_annex//rules:providers.bzl", "reconfigure_deps_configuration")


scala_version = "2.12.7"

compiler_classpath = [
    "@scala_compiler//jar",
    "@scala_library//jar",
    "@scala_reflect//jar",
]

runtime_classpath = [
    "@scala_library//jar",
]

configure_bootstrap_scala(
    name = "bootstrap",
    compiler_classpath = compiler_classpath,
    runtime_classpath = runtime_classpath,
    version = "2.11.12",
    visibility = ["//visibility:public"],
)

scala_library(
    name = "compiler_bridge",
    srcs = [
        "@compiler_bridge_2_12//:src",
    ],
    scala = ":bootstrap",
    visibility = ["//visibility:public"],
    deps = compiler_classpath + [
        "@scala_annex_org_scala_sbt_compiler_interface//jar",
        "@scala_annex_org_scala_sbt_util_interface//jar",
    ],
)

configure_zinc_scala(
    name = "zinc",
    compiler_bridge = ":compiler_bridge",
    compiler_classpath = compiler_classpath,
    runtime_classpath = runtime_classpath,
    version = scala_version,
    visibility = ["//visibility:public"],
    global_plugins = [
        "@macro_paradise//jar",
    ],
)

reconfigure_deps_configuration(
    name = "default_scala",
    provider = ":zinc",
    direct = "off",
    used = "off",
    visibility = ["//visibility:public"],
)
