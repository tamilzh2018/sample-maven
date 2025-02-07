@Library('Jenkins-Shared-Library') _
pipeline{
    agent any


    stages{
        stage("Complie "){
            steps{

                script{
                    echo "========Compiling the code========"
                    build()
                }
               
            }
            
        }
         stage("SonaQube Analysis"){
            steps{
                script{
                    echo "========Running unit test========"
                    withSonarQubeEnv(credentialsId: 'sonar-token') {
                    
                    }
                    scan()
                    
                }
            }
        }
        /*stage("Artifact Storage"){
            steps{
                
                script{
                    echo "========Compiling the code========"
                    scan()
                }
               
            }
            
        }
        stage("Docker Image Creation"){
            steps{
                
                script{
                    echo "========Compiling the code========"
                    scan()
                }
               
            }
            
        }
        stage("Helm Chart Creation"){
            steps{
                
                script{
                    echo "========Compiling the code========"
                    scan()
                }
               
            }
            
        }
        stage("Deploy to Kubernetes"){
            steps{
                
                script{
                    echo "========Compiling the code========"
                    scan()
                }
               
            }
            
        } */
    }
    post{
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }


    }
}