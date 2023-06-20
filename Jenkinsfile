@Library('my-shared-library') _

pipeline {
    agent any

    stages{

        stage ('Git checkout'){
            steps{
                script{
                    
                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/ojoopeyemi74/ci-cd-jenkins-MR-devops-Ope-practise.git"
                    )
                }
            }
        }
        stage ('Unit Testing maven'){
            steps{
                script{
                    
                    mvnTest()
                }
            }
        }
        stage ('mvn Integration test'){
            steps{
                script{
                    mvnintegrationTest()
                }
            }
        }
    }
}