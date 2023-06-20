@Library('my-shared-library') _

pipeline {
    agent any

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/destroy')
        string(name: 'ImageName', description: "name of docker build", defaultValue: 'javapp')
        string(name: 'ImageTag', description: "tagof docker build", defaultValue: 'v1')
        string(name: 'DockerHubUser', description: "name of Application", defaultValue: 'opeyemiojo')
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
        // stage ('Unit Testing maven'){
        //     when {expression { params.action == 'create' }}
        //     steps{
        //         script{
                    
        //             mvnTest()
        //         }
        //     }
        // }
        // stage ('mvn Integration test'){
        //     when {expression { params.action == 'create' }}
        //     steps{
        //         script{
        //             mvnintegrationTest()
        //         }
        //     }
        // }
        // stage ('sonar static code analysis'){
        //     when {expression { params.action == 'create' }}
        //     steps{
        //         script{
        //             staticCodeAnalysis()
        //         }
        //     }
        // }
        // stage("Quality Gate") {
        //     when {expression { params.action == 'create' }}
        //     steps {
        //       script{
        //         qualityGateStatus()
        //       }
        //     }
        //   }
        stage("mvn build"){
            when {expression { params.action == 'create' }}
            steps{
                script{
                    mvnBuild()
                }
            }
        }
        stage("Docker Image Build"){
            when {expression { params.action == 'create' }}
            steps{
                script{
                    dockerBuild("${params.ImageName}", "${params.ImageTag}", "${params.DockerHubUser}")
                }
            }
        }
    }
}