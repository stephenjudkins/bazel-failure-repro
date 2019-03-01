# Do not edit. bazel-deps autogenerates this file from dependencies.yaml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "com.chuusai:shapeless_2.12:2.3.2", "lang": "scala", "sha1": "27e115ffed7917b456e54891de67173f4a68d5f1", "sha256": "75926d9dd4688710ca16d852b58746dcfc013a2a1a58d1e817a27f95b2d42303", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/chuusai/shapeless_2.12/2.3.2/shapeless_2.12-2.3.2.jar", "source": {"sha1": "6d83fa4fa6d25b1e8d8cd9d9d551c05c745633b1", "sha256": "6c00f4454ee1250fb2385e01e02d5751bdf6594e847befab5dbe417c95dbd2b9", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/com/chuusai/shapeless_2.12/2.3.2/shapeless_2.12-2.3.2-sources.jar"} , "name": "com_chuusai_shapeless_2_12", "actual": "@com_chuusai_shapeless_2_12//jar:file", "bind": "jar/com/chuusai/shapeless_2_12"},
    {"artifact": "org.scala-lang:scala-library:2.12.0", "lang": "java", "sha1": "270fc1cda47bc255f3cd03152ec8c2ed7d224e2b", "sha256": "0e72ec4ea955d0bad7f1a494e8df95163f1631df0ce8ec4f9f278fe4d5fd1824", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.0/scala-library-2.12.0.jar", "source": {"sha1": "896700a667d89de8ce18e1fa4b68a5719e5c0271", "sha256": "456b9b5a0cd6581923e8938305eae7a61976706b4e771ef158faf25f85f882dc", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.12.0/scala-library-2.12.0-sources.jar"} , "name": "org_scala_lang_scala_library", "actual": "@org_scala_lang_scala_library//jar", "bind": "jar/org/scala_lang/scala_library"},
    {"artifact": "org.typelevel:macro-compat_2.12:1.1.1", "lang": "java", "sha1": "ed809d26ef4237d7c079ae6cf7ebd0dfa7986adf", "sha256": "8b1514ec99ac9c7eded284367b6c9f8f17a097198a44e6f24488706d66bbd2b8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/typelevel/macro-compat_2.12/1.1.1/macro-compat_2.12-1.1.1.jar", "source": {"sha1": "ade6d6ec81975cf514b0f9e2061614f2799cfe97", "sha256": "c748cbcda2e8828dd25e788617a4c559abf92960ef0f92f9f5d3ea67774c34c8", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/typelevel/macro-compat_2.12/1.1.1/macro-compat_2.12-1.1.1-sources.jar"} , "name": "org_typelevel_macro_compat_2_12", "actual": "@org_typelevel_macro_compat_2_12//jar", "bind": "jar/org/typelevel/macro_compat_2_12"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
