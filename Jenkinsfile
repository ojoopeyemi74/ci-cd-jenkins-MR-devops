pipeline {
    agent any

    stages {
        stage("Clean and Test") {
            steps {
                sh 'mvn clean test'
            }
        }

        stage("Maven Package") {
            steps {
                sh 'mvn package'
            }
        }

        // stage("SonarQube Analysis") {
        //     steps {
        //         withSonarQubeEnv(installationName: 'sonarqube-server', credentialsId: 'sonarqube-token') {
        //             sh 'mvn sonar:sonar'
        //         }
        //     }
        // }

        // stage("Quality Gate") {
        //     steps {
        //         timeout(time: 2, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }
        // stage("Upload jar file to nexus"){
        //     steps{
        //         script{

        //             def readPomVersion = readMavenPom file: 'pom.xml'

        //             def nexusRepo = readPomVersion.version.endsWith("SNAPSHOT") ? "demoapp-snapshot" : "demoapp-release"
                    
        //             nexusArtifactUploader artifacts:
        //              [
        //                 [
        //                     artifactId: 'springboot', 
        //                     classifier: '', 
        //                     file: 'target/Uber.jar', 
        //                     type: 'jar'
        //                     ]
        //                 ], 
        //                     credentialsId: 'nexus-auth', 
        //                     groupId: 'com.example', 
        //                     nexusUrl: '3.8.29.196:8081', 
        //                     nexusVersion: 'nexus3', 
        //                     protocol: 'http', 
        //                     repository: nexusRepo, 
        //                     version: "${readPomVersion.version}"
        //         }
        //     }
        // }
        stage('docker image build'){
            steps{
                script{
                    def imageName = "${JOB_NAME}:v1.${BUILD_ID}"
                    def taggedImageName = "opeyemiojo/${JOB_NAME}:v1.${BUILD_ID}"

                    sh "docker image build -t ${imageName} ."
                    sh "docker image tag ${imageName} ${taggedImageName}"
                    sh "docker image tag ${imageName} opeyemi/${JOB_NAME}:latest"
                }
            }
        }
    }
}