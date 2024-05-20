plugins {
  `java-library`
  id("software.amazon.smithy.gradle.smithy-jar")
}

repositories {
  mavenLocal()
  mavenCentral()
}

dependencies {
  val smithyVersion: String by project

  smithyCli("software.amazon.smithy:smithy-cli:$smithyVersion")

  implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
  implementation("software.amazon.smithy:smithy-linters:$smithyVersion")
  implementation("software.amazon.smithy:smithy-model:$smithyVersion")
  implementation("software.amazon.smithy:smithy-openapi:$smithyVersion")
}
