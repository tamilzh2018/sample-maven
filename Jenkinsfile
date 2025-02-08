@Library('Jenkins-Shared-Library') _

pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = 'sample-java-project'
        NEXUS_SNAPSHOTS_CREDENTIALS_ID = 'java-snapshot'  // ID for Nexus snapshots URL stored as a secret in Jenkins
        NEXUS_RELEASES_CREDENTIALS_ID = 'java-release-url'   // ID for Nexus releases URL stored as a secret in Jenkins
        VERSION = "${env.BUILD_NUMBER}"
        // REPO_URL = VERSION.endsWith('-SNAPSHOT') ? "${NEXUS_SNAPSHOTS_CREDENTIALS_ID}" : "${NEXUS_RELEASES_CREDENTIALS_ID}"

    }
    stages {
        stage('Build') {
            steps {
                script {
                    echo "========Compiling the code========"
                    build()  // Assuming 'build' is a custom function or command.
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withCredentials([string(credentialsId: 'sonar-token', variable: 'SONAR_TOKEN'), string(credentialsId: 'sonar-server-url', variable: 'SONAR_HOST_URL')]) {
                    echo "Running SonarQube Analysis"
                    sonarScan(SONAR_PROJECT_KEY)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo "========Running Unit Tests========"
                    sh 'mvn test'
                }
            }
        }
        stage('Publish Test Results') {
            steps {
                script {
                    echo "========Publishing Unit Test Results========"
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Deploy to Nexus') {
            steps {
                nexusArtifactUploader(
                    nexusVersion: 'nexus3',
                    protocol: 'http',
                    nexusUrl: "nexus-url",
                    repository: 'java-snapshot',
                    credentialsId: 'Nexus-Credentials',
                    groupId: 'com.myproject.app',
                    version: "${VERSION}",
                    artifacts: [
                        [artifactId: sample-java-project,
                        classifier: '',
                        file: 'target/sample-java-project-1.0.0.jar',
                        type: 'jar']
                    ]

                )

            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}