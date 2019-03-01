Tried with Bazel 0.22 and 0.23.

Used commit e3f77e22d9f5b070915067a766607cfc96835c98 of https://github.com/johnynek/bazel-deps to generate `3rdparty`, using the following command:

```../bazel-deps/bazel-bin/src/scala/com/github/johnynek/bazel_deps/parseproject generate -v trace -r `pwd` -s 3rdparty/workspace.bzl -d dependencies.yaml```

When attempting to build, I see the following failure:

```
false-dmitri:bazel-failure stephen$ bazel build //commons
ERROR: /Users/stephen/gemini/cruft/bazel-failure/3rdparty/jvm/com/chuusai/BUILD:2:1: in scala_import rule //3rdparty/jvm/com/chuusai:shapeless: 
Traceback (most recent call last):
	File "/Users/stephen/gemini/cruft/bazel-failure/3rdparty/jvm/com/chuusai/BUILD", line 2
		scala_import(name = 'shapeless')
	File "/private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/rules_scala_annex/rules/scala/private/import.bzl", line 41, in scala_import_implementation
		java_common.pack_sources(ctx.actions, output_jar = output_j..., <3 more arguments>)
Output artifact 'external/com_chuusai_shapeless_2_12/jar/com_chuusai_shapeless_2_12-src.jar' not under package directory '3rdparty/jvm/com/chuusai' for target '//3rdparty/jvm/com/chuusai:shapeless'
ERROR: Analysis of target '//commons:commons' failed; build aborted: Analysis of target '//3rdparty/jvm/com/chuusai:shapeless' failed; build aborted
INFO: Elapsed time: 0.094s
INFO: 0 processes.
FAILED: Build did NOT complete successfully (0 packages loaded, 0 targets configured)
```