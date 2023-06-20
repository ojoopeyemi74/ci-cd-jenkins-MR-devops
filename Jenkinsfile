pipeline {
    agent any

    tools {
        maven "maven"
    }

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