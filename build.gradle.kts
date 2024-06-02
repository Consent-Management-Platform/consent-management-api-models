plugins {
  java
  `java-library`
  `maven-publish`
  id("software.amazon.smithy.gradle.smithy-jar")
  id("org.openapi.generator") version("7.5.0")
}

repositories {
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

val mavenPackageGroupId = "com.consentframework.consentmanagement"
val mavenPackageArtifactId = "consentmanagement-api-models"
val mavenPackageVersion = "0.2.1"

val openApiGeneratedSourcesFolder = "${layout.buildDirectory.get()}/generated-sources"

// Generate Java model classes from OpenAPI JSON spec
openApiGenerate {
  generatorName.set("java")
  inputSpec.set("$rootDir/build/smithyprojections/consent-management-api-models/source/openapi/ConsentManagementApi.openapi.json")
  outputDir.set(openApiGeneratedSourcesFolder)
  modelPackage.set("com.consentframework.consentmanagement.api.models")
  groupId.set(mavenPackageGroupId)
  id.set(mavenPackageArtifactId)
  version.set(mavenPackageVersion)

  // Configure to only generate model classes
  globalProperties.set(mapOf(
    "apis" to "false",
    "apiTests" to "false",
    "models" to "",
    "modelDocs" to "false",
    "modelTests" to "false"
  ))
}

java {
  sourceSets {
    main {
      listOf("${openApiGeneratedSourcesFolder}/src/main/java")
    }
  }
}

// Publish jar to GitHub Packages so can import into other repositories
publishing {
  repositories {
    maven {
      name = "GitHubPackages"
      url = uri("https://maven.pkg.github.com/msayson/consent-management-api-models")
      credentials {
        username = project.findProperty("gpr.user") as String? ?: System.getenv("GITHUB_USERNAME")
        password = project.findProperty("gpr.key") as String? ?: System.getenv("GITHUB_TOKEN")
      }
    }
  }

  publications {
    register<MavenPublication>("gpr") {
      groupId = mavenPackageGroupId
      artifactId = mavenPackageArtifactId
      version = mavenPackageVersion

      from(components["java"])
    }
  }
}

tasks.openApiGenerate {
  dependsOn(tasks.smithyBuild)
}

tasks.compileJava {
  dependsOn(tasks.openApiGenerate)
}
