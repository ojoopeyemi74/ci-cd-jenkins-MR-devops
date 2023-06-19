pipeline {
    agent any

    stages{

        stage ('Git checkout'){
            steps {
                script{
                    git branch: 'main', url: 'https://github.com/ojoopeyemi74/ci-cd-jenkins-MR-devops-Ope-practise.git'
                }
            }
        }
    }
}