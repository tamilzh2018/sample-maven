@Library('Jenkins-Shared-Library') _

pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = 'sample-java-project'
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
    }
    post {
        always {
            archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
        }
    }
}
