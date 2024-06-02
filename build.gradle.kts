plugins {
  `java-library`
  `maven-publish`
  id("software.amazon.smithy.gradle.smithy-jar")
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
      groupId = "com.consentframework.consentmanagement"
      artifactId = "consentmanagement-api-models"
      version = "0.2.1"

      from(components["java"])
    }
  }
}
