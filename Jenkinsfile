
pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                sh 'echo "checkout"'
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
