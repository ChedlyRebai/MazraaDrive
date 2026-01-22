
pipeline {
    agent any
    
    triggers {
        githubPush()
    }
    stages {
        stage('checkout') {
            steps {
                sh 'echo "cessshd"'
            }
        }
        stage('build') {
            steps {
                sh 'echo "Building ..."'
            }
        }

        stage('test') {
            steps {
                sh ' echo "Testing ..."'
            }
        }
    }

    post {
        always {
            sh 'echo "always"'
        }
    }
}
