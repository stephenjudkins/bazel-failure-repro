Tried with Bazel 0.22 and 0.23.

When running `bazel build //commons`, I see the following error:

```
false-dmitri:bazel-failure stephen$ bazel build -s //commons
WARNING: /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/bazel_tools/tools/jdk/BUILD:99:1: in alias rule @bazel_tools//tools/jdk:java: target '@bazel_tools//tools/jdk:java' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /Users/stephen/gemini/cruft/bazel-failure/scala/BUILD:31:1: in scala_library rule //scala:compiler_bridge: target '//scala:compiler_bridge' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/rules_scala_annex/src/main/scala/higherkindness/rules_scala/common/worker/BUILD:4:1: in scala_library rule @rules_scala_annex//src/main/scala/higherkindness/rules_scala/common/worker:worker: target '@rules_scala_annex//src/main/scala/higherkindness/rules_scala/common/worker:worker' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/rules_scala_annex/src/main/scala/higherkindness/rules_scala/common/args/BUILD:4:1: in scala_library rule @rules_scala_annex//src/main/scala/higherkindness/rules_scala/common/args:args: target '@rules_scala_annex//src/main/scala/higherkindness/rules_scala/common/args:args' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/rules_scala_annex/src/main/scala/higherkindness/rules_scala/workers/zinc/common/BUILD:4:1: in scala_library rule @rules_scala_annex//src/main/scala/higherkindness/rules_scala/workers/zinc/common:common: target '@rules_scala_annex//src/main/scala/higherkindness/rules_scala/workers/zinc/common:common' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/rules_scala_annex/src/main/scala/higherkindness/rules_scala/workers/zinc/compile/BUILD:4:1: in scala_binary rule @rules_scala_annex//src/main/scala/higherkindness/rules_scala/workers/zinc/compile:compile: target '@rules_scala_annex//src/main/scala/higherkindness/rules_scala/workers/zinc/compile:compile' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/external/rules_scala_annex/src/main/scala/higherkindness/rules_scala/workers/deps/BUILD:4:1: in scala_binary rule @rules_scala_annex//src/main/scala/higherkindness/rules_scala/workers/deps:deps: target '@rules_scala_annex//src/main/scala/higherkindness/rules_scala/workers/deps:deps' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
WARNING: /Users/stephen/gemini/cruft/bazel-failure/commons/BUILD:6:1: in scala_library rule //commons:commons: target '//commons:commons' depends on deprecated target '@local_jdk//:java': Don't depend on targets in the JDK workspace; use @bazel_tools//tools/jdk:current_java_runtime instead (see https://github.com/bazelbuild/bazel/issues/5594)
INFO: Analysed target //commons:commons (0 packages loaded, 0 targets configured).
INFO: Found 1 target...
SUBCOMMAND: # //commons:commons [action 'ScalaCompile commons/commons/classes.jar']
(cd /private/var/tmp/_bazel_stephen/9d6c2752ecfec9c33256bdae332e1450/execroot/test && \
  exec env - \
  bazel-out/host/bin/external/rules_scala_annex/src/main/scala/higherkindness/rules_scala/workers/zinc/compile/compile-bin @bazel-out/darwin-fastbuild/bin/commons/commons/classes.jar-0.params)
ERROR: /Users/stephen/gemini/cruft/bazel-failure/commons/BUILD:6:1: ScalaCompile commons/commons/classes.jar failed (Exit 1)
java.lang.ClassFormatError: Absent Code attribute in method that is not native or abstract in class file com/google/common/base/Predicate
## Exception when compiling 1 sources to bazel-out/darwin-fastbuild/bin/commons/commons/tmp/classes/commons_commons
Absent Code attribute in method that is not native or abstract in class file com/google/common/base/Predicate
java.lang.ClassLoader.defineClass1(Native Method)
java.lang.ClassLoader.defineClass(ClassLoader.java:763)
java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)
java.net.URLClassLoader.defineClass(URLClassLoader.java:467)
java.net.URLClassLoader.access$100(URLClassLoader.java:73)
java.net.URLClassLoader$1.run(URLClassLoader.java:368)
java.net.URLClassLoader$1.run(URLClassLoader.java:362)
java.security.AccessController.doPrivileged(Native Method)
java.net.URLClassLoader.findClass(URLClassLoader.java:361)
java.lang.ClassLoader.loadClass(ClassLoader.java:424)
java.lang.ClassLoader.loadClass(ClassLoader.java:357)
java.lang.ClassLoader.defineClass1(Native Method)
java.lang.ClassLoader.defineClass(ClassLoader.java:763)
java.security.SecureClassLoader.defineClass(SecureClassLoader.java:142)
java.net.URLClassLoader.defineClass(URLClassLoader.java:467)
java.net.URLClassLoader.access$100(URLClassLoader.java:73)
java.net.URLClassLoader$1.run(URLClassLoader.java:368)
java.net.URLClassLoader$1.run(URLClassLoader.java:362)
java.security.AccessController.doPrivileged(Native Method)
java.net.URLClassLoader.findClass(URLClassLoader.java:361)
java.lang.ClassLoader.loadClass(ClassLoader.java:424)
java.lang.ClassLoader.loadClass(ClassLoader.java:357)
java.lang.Class.getDeclaredMethods0(Native Method)
java.lang.Class.privateGetDeclaredMethods(Class.java:2701)
java.lang.Class.privateGetPublicMethods(Class.java:2902)
java.lang.Class.getMethods(Class.java:1615)
sbt.internal.inc.ClassToAPI$.toDefinitions0(ClassToAPI.scala:164)
sbt.internal.inc.ClassToAPI$.$anonfun$toDefinitions$1(ClassToAPI.scala:121)
scala.collection.mutable.HashMap.getOrElseUpdate(HashMap.scala:86)
sbt.internal.inc.ClassToAPI$.toDefinitions(ClassToAPI.scala:121)
sbt.internal.inc.ClassToAPI$.$anonfun$process$1(ClassToAPI.scala:28)
scala.collection.mutable.ResizableArray.foreach(ResizableArray.scala:62)
scala.collection.mutable.ResizableArray.foreach$(ResizableArray.scala:55)
scala.collection.mutable.ArrayBuffer.foreach(ArrayBuffer.scala:49)
sbt.internal.inc.ClassToAPI$.process(ClassToAPI.scala:28)
sbt.internal.inc.javac.AnalyzingJavaCompiler.readAPI$1(AnalyzingJavaCompiler.scala:143)
sbt.internal.inc.javac.AnalyzingJavaCompiler.$anonfun$compile$20(AnalyzingJavaCompiler.scala:161)
sbt.internal.inc.classfile.Analyze$.readInheritanceDependencies$1(Analyze.scala:148)
sbt.internal.inc.classfile.Analyze$.$anonfun$apply$14(Analyze.scala:154)
sbt.internal.inc.classfile.Analyze$.$anonfun$apply$14$adapted(Analyze.scala:81)
scala.collection.TraversableLike$WithFilter.$anonfun$foreach$1(TraversableLike.scala:792)
scala.collection.mutable.HashMap.$anonfun$foreach$1(HashMap.scala:149)
scala.collection.mutable.HashTable.foreachEntry(HashTable.scala:237)
scala.collection.mutable.HashTable.foreachEntry$(HashTable.scala:230)
scala.collection.mutable.HashMap.foreachEntry(HashMap.scala:44)
scala.collection.mutable.HashMap.foreach(HashMap.scala:149)
scala.collection.TraversableLike$WithFilter.foreach(TraversableLike.scala:791)
sbt.internal.inc.classfile.Analyze$.apply(Analyze.scala:81)
sbt.internal.inc.javac.AnalyzingJavaCompiler.$anonfun$compile$19(AnalyzingJavaCompiler.scala:161)
sbt.internal.inc.javac.AnalyzingJavaCompiler.$anonfun$compile$19$adapted(AnalyzingJavaCompiler.scala:159)
scala.collection.TraversableLike$WithFilter.$anonfun$foreach$1(TraversableLike.scala:792)
scala.collection.immutable.List.foreach(List.scala:392)
scala.collection.TraversableLike$WithFilter.foreach(TraversableLike.scala:791)
sbt.internal.inc.javac.AnalyzingJavaCompiler.$anonfun$compile$17(AnalyzingJavaCompiler.scala:159)
scala.runtime.java8.JFunction0$mcV$sp.apply(JFunction0$mcV$sp.java:23)
sbt.internal.inc.javac.AnalyzingJavaCompiler.timed(AnalyzingJavaCompiler.scala:196)
sbt.internal.inc.javac.AnalyzingJavaCompiler.compile(AnalyzingJavaCompiler.scala:159)
sbt.internal.inc.MixedAnalyzingCompiler.$anonfun$compile$4(MixedAnalyzingCompiler.scala:105)
scala.runtime.java8.JFunction0$mcV$sp.apply(JFunction0$mcV$sp.java:23)
sbt.internal.inc.MixedAnalyzingCompiler.timed(MixedAnalyzingCompiler.scala:133)
sbt.internal.inc.MixedAnalyzingCompiler.compileJava$1(MixedAnalyzingCompiler.scala:90)
sbt.internal.inc.MixedAnalyzingCompiler.compile(MixedAnalyzingCompiler.scala:116)
sbt.internal.inc.IncrementalCompilerImpl.$anonfun$compileInternal$1(IncrementalCompilerImpl.scala:307)
sbt.internal.inc.IncrementalCompilerImpl.$anonfun$compileInternal$1$adapted(IncrementalCompilerImpl.scala:307)
sbt.internal.inc.Incremental$.doCompile(Incremental.scala:106)
sbt.internal.inc.Incremental$.$anonfun$compile$4(Incremental.scala:87)
sbt.internal.inc.IncrementalCommon.recompileClasses(IncrementalCommon.scala:116)
sbt.internal.inc.IncrementalCommon.cycle(IncrementalCommon.scala:63)
sbt.internal.inc.Incremental$.$anonfun$compile$3(Incremental.scala:89)
sbt.internal.inc.Incremental$.manageClassfiles(Incremental.scala:134)
sbt.internal.inc.Incremental$.compile(Incremental.scala:80)
sbt.internal.inc.IncrementalCompile$.apply(Compile.scala:67)
sbt.internal.inc.IncrementalCompilerImpl.compileInternal(IncrementalCompilerImpl.scala:311)
sbt.internal.inc.IncrementalCompilerImpl.$anonfun$compileIncrementally$1(IncrementalCompilerImpl.scala:269)
sbt.internal.inc.IncrementalCompilerImpl.handleCompilationError(IncrementalCompilerImpl.scala:159)
sbt.internal.inc.IncrementalCompilerImpl.compileIncrementally(IncrementalCompilerImpl.scala:238)
sbt.internal.inc.IncrementalCompilerImpl.compile(IncrementalCompilerImpl.scala:69)
higherkindness.rules_scala.workers.zinc.compile.ZincRunner$.work(ZincRunner.scala:225)
higherkindness.rules_scala.workers.zinc.compile.ZincRunner$.work(ZincRunner.scala:54)
higherkindness.rules_scala.common.worker.WorkerMain.main(WorkerMain.scala:80)
higherkindness.rules_scala.common.worker.WorkerMain.main$(WorkerMain.scala:22)
higherkindness.rules_scala.workers.zinc.compile.ZincRunner$.main(ZincRunner.scala:54)
higherkindness.rules_scala.workers.zinc.compile.ZincRunner.main(ZincRunner.scala)
           
You may be missing a `macro = True` attribute.
Target //commons:commons failed to build
Use --verbose_failures to see the command lines of failed build steps.
INFO: Elapsed time: 2.392s, Critical Path: 2.09s
INFO: 0 processes.
FAILED: Build did NOT complete successfully
```