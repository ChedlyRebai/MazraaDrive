
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
        DOCKER_USERNAME = 'chedlyrebai'
        BACKEND_IMAGE = "${REGISTRY}/${DOCKER_USERNAME}/drive-api"
        FRONTEND_IMAGE = "${REGISTRY}/${DOCKER_USERNAME}/drive-ui"
        SONARQUEBE_HOST = 'http://localhost:9000'
        SONAR_PROJECT_KEY = 'MazaaDrive'
        SONAR_LOGIN = credentials('drive-sonar-token')
        HELM_RELEASE_NAME = 'drive'
        HELM_NAMESPACE = 'helm'
        TAG_NUMBER = 50 
        //KUBECONFIG = credentials('kubeconfig')
    }

    // tools {
    //     // Uses the Jenkins NodeJS plugin installation named 'node-20'
    //     nodejs 'Node 21'
    // }

    // parameters {
    //     choice(name: 'ENVIRONMENT', choices: ['dev', 'staging', 'production'], description: 'Deployment environment')
    //     booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip running tests')
    // }

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
        // stage('BAckend - code quality)') {

        //     steps {

        //         dir('backend') {
        //             script {
        //                 sh '''
        //                     # Add dotnet global tools to PATH
        //                     export PATH="$HOME/.dotnet/tools:$PATH"

        //                     # Install dotnet-sonarscanner if not already installed
        //                     dotnet tool install --global dotnet-sonarscanner || dotnet tool update --global dotnet-sonarscanner

        //                     # Begin SonarQube analysis
        //                     dotnet sonarscanner begin \
        //                     /k:"${SONAR_PROJECT_KEY}" \
        //                     /d:sonar.host.url="${SONARQUEBE_HOST}" \
        //                     /d:sonar.login="${SONAR_LOGIN}"

        //                     # Build the project
        //                     dotnet build

        //                     # End SonarQube analysis
        //                     dotnet sonarscanner end /d:sonar.login="${SONAR_LOGIN}"
        //                 '''
        //             }
        //         }
        //     }
        // }

        // stage('OWASP security'){
        //     steps {
        //         dir('backend'){
        //             script{
        //                 sh'''
        //                     dotnet list package --vulnerable || true
        //                 '''
        //         }
        //         }
        //         dir('client'){
        //             script {
        //                 sh '''
        //                     npm audit --audit-level=moderate || true
        //                 '''
        //             }
        //         }

        //     }
        // }

        // stage('Build Docker image') {
        //     steps {
        //         script {
        //             sh '''
        //                  docker build -t ${FRONTEND_IMAGE}:${BUILD_NUMBER}  -f client/Dockerfile client
        //                  docker build -t ${BACKEND_IMAGE}:${BUILD_NUMBER} -f backend/Dockerfile backend
        //              '''
        //         }
        //     }
        // }

        // stage('Security Scan') {
        //     steps {
        //         script {
        //             sh '''
        //                 # Scan both images using Trivy in Docker (avoids snap issues)
        //                 docker run --rm \
        //                     -v /var/run/docker.sock:/var/run/docker.sock \
        //                     aquasec/trivy:latest image \
        //                     --exit-code 1 \
        //                     --severity HIGH,CRITICAL \
        //                     ${FRONTEND_IMAGE}:${BUILD_NUMBER} || true
                        
        //                 docker run --rm \
        //                     -v /var/run/docker.sock:/var/run/docker.sock \
        //                     aquasec/trivy:latest image \
        //                     --exit-code 1 \
        //                     --severity HIGH,CRITICAL \
        //                     ${BACKEND_IMAGE}:${BUILD_NUMBER} || true
        //              '''
        //         }
        //     }
        // }

        // stage('Push docker image') {
        //     steps {
        //         script {
        //             withDockerRegistry([
        //              credentialsId: 'chedlyrebai-dockerhub',
        //              url: 'https://index.docker.io/v1/'
        //          ]) {
        //                 sh 'echo docker login successful'
        //                 sh " docker push ${FRONTEND_IMAGE}:${TAG_NUMBER}"
        //                 sh " docker push ${BACKEND_IMAGE}:${TAG_NUMBER}"
        //          }
        //         }
        //     }
        // }

        stage('Deploy with Helm') {
            steps {
                script {
                    sh '''
                        
                        export KUBECONFIG=$HOME/.kube/config
                        
                        # Verify kubeconfig exists
                        if [ ! -f "$KUBECONFIG" ]; then
                            echo "ERROR: kubeconfig file not found at $KUBECONFIG"
                            exit 1
                        fi
                        
                        # Verify kubectl can connect to cluster
                        echo "Testing kubectl connection..."
                        if ! kubectl cluster-info; then
                            echo "ERROR: Cannot connect to Kubernetes cluster"
                            exit 1
                        fi
                        
                        # Verify Helm is available
                        if command -v helm &> /dev/null; then
                            echo "Helm found at: $(which helm)"
                            helm version
                        else
                            echo "ERROR: Helm not found. Please install Helm on the Jenkins agent."
                            exit 1
                        fi                        
                        # Update Helm dependencies
                        cd drive
                        helm dependency update
                        
                        # Deploy or upgrade the release
                        helm upgrade --install ${HELM_RELEASE_NAME} . \
                            --namespace ${HELM_NAMESPACE} \
                            --create-namespace \
                            --set backend.image.tag=${TAG_NUMBER} \
                            --set frontend.image.tag=${TAG_NUMBER} \
                            --set backend.image.repository=${BACKEND_IMAGE} \
                            --set frontend.image.repository=${FRONTEND_IMAGE} \
                            --wait \
                            --timeout 5m
                        
                        # Show deployment status
                        helm list -n ${HELM_NAMESPACE}
                        kubectl get pods -n ${HELM_NAMESPACE}
                    '''
                }
            }
        }
    // stage('Build - Frontend') {
    //     steps {
    //         dir('client') {
    //             sh '''
    //                 node -v
    //                 npm ci
    //                 npm run build -- --configuration production
    //             '''
    //         }
    //     }
    // }
    }
}
