pipeline {
    agent any

    tools {
        maven "maven"
    }

    environment {
        registry = '772745136297.dkr.ecr.eu-west-2.amazonaws.com/hellodatarepo'
        registryCredential = 'jenkins-ecr-login-credentials'
        dockerImage = ''
    }

    stages {
        stage("Checkout from GitHub") {
            steps {
                git branch: 'master', url: 'https://github.com/ojoopeyemi74/springboot-maven-micro.git'
            }
        }

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

        stage("SonarQube Analysis") {
            steps {
                withSonarQubeEnv(installationName: 'sonarqube-server', credentialsId: 'sonarqube-token') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage("Quality Gate") {
            steps {
                timeout(time: 2, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}