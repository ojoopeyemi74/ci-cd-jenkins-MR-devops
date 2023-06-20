@Library('my-shared-library') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/destroy')
    }

    stages{

        stage ('Git checkout'){
            when {expression { params.action == 'create' }}
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
            when {expression { params.action == 'create' }}
            steps{
                script{
                    
                    mvnTest()
                }
            }
        }
        stage ('mvn Integration test'){
            when {expression { params.action == 'create' }}
            steps{
                script{
                    mvnintegrationTest()
                }
            }
        }
        stage ('sonar static code analysis'){
            when {expression { params.action == 'create' }}
            steps{
                script{
                    staticCodeAnalysis()
                }
            }
        }
        stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true
              }
            }
          }
    }
}