@Library('Jenkins-Shared-Library') _

pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = 'sample-java-project'
        NEXUS_SNAPSHOTS_CREDENTIALS_ID = 'nexus-snapshots-url' // ID for Nexus snapshots URL stored as a secret in Jenkins
        NEXUS_RELEASES_CREDENTIALS_ID = 'nexus-releases-url'   // ID for Nexus releases URL stored as a secret in Jenkins
    }
    stages {
        stage('Build') {
            steps {
                script {
                    echo "========Compiling the code========"
                    build()
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
                script {
                    echo "========Deploying to Nexus Repository========"
                    def version = readMavenPom().getVersion()
                    if (version.endsWith('-SNAPSHOT')) {
                        nexusDeploy('java-snapshot', NEXUS_SNAPSHOTS_CREDENTIALS_ID)
                    } else {
                        nexusDeploy('java-releases', NEXUS_RELEASES_CREDENTIALS_ID)
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
