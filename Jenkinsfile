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
    }
}