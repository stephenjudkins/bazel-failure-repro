load("@rules_scala_annex//rules:scala.bzl", scala_import = "scala_import")
java_library(
    name = "scala_compiler",
    exports = [
        "//3rdparty/jvm/org/scala_lang/modules:scala_xml_2_12",
        "//external:jar/org/scala_lang/scala_compiler",
        ":scala_library",
        ":scala_reflect"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "scala_library",
    exports = [
        "//external:jar/org/scala_lang/scala_library"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "scala_reflect",
    exports = [
        "//external:jar/org/scala_lang/scala_reflect",
        ":scala_library"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


