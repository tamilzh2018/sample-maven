@Library('Jenkins-Shared-Library') _

pipeline {
    agent any
    environment {
        SONAR_PROJECT_KEY = 'sample-java-project'
    }
    stages {

        stage('Build') {
            steps{

                script{
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
        stage('Publish Test Results') {
            steps {
                script {
                    echo "========Publish Unit Test========"
                    sh 'mvn test'
                    junit '**/target/surefire-reports/*.xml'
                }
            }
        }
    }
    
}