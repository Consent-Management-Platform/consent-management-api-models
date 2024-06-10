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
  // Smithy models and OpenAPI JSON spec generator
  val smithyVersion: String by project
  smithyCli("software.amazon.smithy:smithy-cli:$smithyVersion")
  implementation("software.amazon.smithy:smithy-aws-traits:$smithyVersion")
  implementation("software.amazon.smithy:smithy-linters:$smithyVersion")
  implementation("software.amazon.smithy:smithy-model:$smithyVersion")
  implementation("software.amazon.smithy:smithy-openapi:$smithyVersion")

  // Dependencies required by OpenAPI Generator-generated classes
  val jacksonVersion = "2.17.1"
  implementation("jakarta.annotation:jakarta.annotation-api:3.0.0")
  implementation("com.fasterxml.jackson.core:jackson-core:$jacksonVersion")
  implementation("com.fasterxml.jackson.core:jackson-annotations:$jacksonVersion")
  implementation("com.fasterxml.jackson.core:jackson-databind:$jacksonVersion")
  implementation("com.fasterxml.jackson.datatype:jackson-datatype-jsr310:$jacksonVersion")
  implementation("org.openapitools:jackson-databind-nullable:0.2.6")
}

val mavenPackageGroupId = "com.consentframework.consentmanagement"
val mavenPackageVersion = "0.2.8"

val openApiGeneratedSourcesFolder = "${layout.buildDirectory.get()}/generated-sources"

// Generate Java model classes from OpenAPI JSON spec
openApiGenerate {
  // Generator selection
  // Ref: https://openapi-generator.tech/docs/generators/java/
  generatorName.set("java")
  library.set("native")

  // Input/output and Java namespaces
  inputSpec.set("$rootDir/build/smithyprojections/consent-management-api-models/source/openapi/ConsentManagementApi.openapi.json")
  outputDir.set(openApiGeneratedSourcesFolder)
  apiPackage.set("com.consentframework.consentmanagement.api.client")
  modelPackage.set("com.consentframework.consentmanagement.api.models")

  // Generated package group/id/version
  groupId.set(mavenPackageGroupId)
  id.set("consentmanagement-api-java-client")
  version.set(mavenPackageVersion)

  configOptions.set(mapOf(
    "hideGenerationTimestamp" to "true",
    "useJakartaEe" to "true",
    "useOptional" to "true"
  ))
}

sourceSets["main"].java.srcDir("${openApiGeneratedSourcesFolder}/src/main/java")

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
      artifactId = "consentmanagement-api-models"
      version = mavenPackageVersion

      from(components["java"])
    }
  }
}

tasks.clean {
  delete("$rootDir/bin")
  delete("$rootDir/build")
}

tasks.openApiGenerate {
  dependsOn(tasks.smithyBuild)
}

tasks.compileJava {
  dependsOn(tasks.openApiGenerate)
}
