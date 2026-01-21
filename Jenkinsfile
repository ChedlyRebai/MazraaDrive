
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
        // always {
        //     sh 'always run'
        // }

        // success {
        //     sh 'This will run only if successful'
        // }

        // failure {
        //     sh 'This will run only if failed'
        // }
    }


}