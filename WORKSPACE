workspace(name = "test")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

http_archive(
    name = "bazel_skylib",
    sha256 = "c0289fef5237c31e8462042b4cc3bdf831a3d3d135bb4a0d493a5072acecb074",
    strip_prefix = "bazel-skylib-2169ae1c374aab4a09aa90e65efe1a3aad4e279b",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/2169ae1c374aab4a09aa90e65efe1a3aad4e279b.zip"],
)

http_archive(
    name = "com_google_protobuf",
    sha256 = "2c8f8614fb1be709d68abaab6b4791682aa7db2048012dd4642d3a50b4f67cb3",
    strip_prefix = "protobuf-0038ff49af882463c2af9049356eed7df45c3e8e",
    urls = ["https://github.com/google/protobuf/archive/0038ff49af882463c2af9049356eed7df45c3e8e.zip"],
)

http_archive(
    name = "rules_scala_annex",
    sha256 = "684fdce62c6dcd0d0880b29067dd5f391d58c8aa53a2b2fcc85a871c11d308c5",
    strip_prefix = "rules_scala-2d5bae52690590d5184be02e69f30242ac4b9957",
    urls = ["https://github.com/higherkindness/rules_scala/archive/2d5bae52690590d5184be02e69f30242ac4b9957.zip"]
)

load(
    "@rules_scala_annex//rules/scala:workspace.bzl",
    "scala_register_toolchains",
    "scala_repositories",
)

scala_repositories()

scala_register_toolchains()

load(
    "@rules_scala_annex//rules/scala_proto:workspace.bzl",
    "scala_proto_register_toolchains",
    "scala_proto_repositories",
)

scala_proto_repositories()

scala_proto_register_toolchains()

load("@rules_scala_annex//rules:rules_scala.bzl", "emulate_rules_scala")
load("@rules_scala_annex//rules:external.bzl", "scala_import_external")


scala_version = "2.12.7"

maven_url = "https://repo.maven.apache.org/maven2/"

jvm_maven_import_external(
    name = "scala_compiler",
    artifact = "org.scala-lang:scala-compiler:" + scala_version,
    licenses = ["notice"],
    server_urls = [maven_url],
)

jvm_maven_import_external(
    name = "scala_library",
    artifact = "org.scala-lang:scala-library:" + scala_version,
    licenses = ["notice"],
    server_urls = [maven_url],
)

jvm_maven_import_external(
    name = "scala_reflect",
    artifact = "org.scala-lang:scala-reflect:" + scala_version,
    licenses = ["notice"],
    server_urls = [maven_url],
)

jvm_maven_import_external(
    name = "macro_paradise",
    artifact = "org.scalamacros:paradise_" + scala_version + ":2.1.0",
    licenses = ["notice"],
    server_urls = [maven_url],
)

bind(
    name = "default_scala",
    actual = "//scala:default_scala",
)

load("//3rdparty:workspace.bzl", "maven_dependencies")
maven_dependencies()