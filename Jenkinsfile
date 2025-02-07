@Library('Jenkins-Shared-Library') _
pipeline{
    agent any

    stages{
        stage("Complie and Scan"){
            steps{

                script{
                    echo "========Compiling the code========"
                    scan()
                }
               
            }
            
        }
        /* stage("Unit Test"){
            steps{
                script{
                    echo "========Running unit test========"
                    unitTest()
                }
            }
        }
        stage("Artifact Storage"){
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