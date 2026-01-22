
pipeline {
    agent any

    options {
        timestamps()
        timeout(time:1, unit:'HOURS')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }

    environment {
        REGISTRY = 'docker.io'
        REGESTRY_CREDENTIALS = 'docker-hub'
        BACKEND_IMAGE = "${REGISTRY}/chedlyrebai/drive-ui"
        FRONTEND_IMAGE = "${REGISTRY}/chedlyrebai/drive-api"
        SONARQUEBE_HOST = 'http://sonarqube:9000'
    }

    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'production'], description: 'Deployment environment')
        booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip running tests')
    }

    triggers {
        githubPush()
    }
    stages {
        // stage('Clean Workspace') {
        //     steps {
        //         cleanWs()
        //         script {
        //             echo 'pipeline started'
        //         }
        //     }
        // }
        //20e275e7ab84151f39fff215d01e227d3589694b
        //a6f3afeaea35f9c3b6fd7b22ba3c14d4fa9c3aea
        // stage('Chekout') {
        //     steps {
        //         script {
        //             checkout([$class:'GitSCM',
        //                  branch:[[name:'*/master']],
        //                   userRemoteConfigs:[[
        //                       url:'git@github.com:ChedlyRebai/MazraaDrive.git',
        //                       credentialsId:'chedlydrive'
        //                   ]]
        //              ])
        //             GIT_COMMIT_SHORT = sh(script:'git rev-parse --short HEAD', returnStdout:true).trim()
        //             GIT_BRANCH = sh(script:'git rev-parse --abbrev-ref HEAD', returnStdout:true).trim()
        //             echo "bracnch ${GIT_BRANCH}"
        //             echo "branch ${GIT_COMMIT_SHORT}"
        //         }
        //     }
        // }

        // stage('Build - bakcend') {
        //     steps {
        //         dir('backend') {
        //             script {
        //                 echo 'Building .Net BAckend...'
        //                 sh '''
        //                     dotnet restore Api/Api.csproj
        //                     dotnet  build Api/Api.csproj --configuration Release --no-restore
        //                     echo "Backend build completed successfully"
        //                 '''
        //             }
        //         }
        //     }
        // }

        stage('Build - Frontend') {
            steps {
                dir('client') {
                    script {
                        sh '''
                            # Use Node.js v20.19.4 if nvm is available
                            if command -v nvm &> /dev/null; then
                                nvm use 20.19.4 || nvm install 20.19.4
                            fi
                            node -v
                            npm ci
                            npm run build -- --configuartion production
                        '''
                    }
                }
            }
        }
    }
}
