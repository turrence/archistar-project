pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-credentials')
    }

    stages {
        stage('Build and Push') {
            steps {
                script {
                    // Use withCredentials to securely pass Docker Hub credentials
                    withCredentials([usernamePassword(credentialsId: 'docker-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        // Build Docker image
                        sh 'docker build -t turrence/archistar-project .'

                        // Login to Docker Hub
                        sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'

                        // Push Docker image to Docker Hub
                        sh 'docker push turrence/archistar-project'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker rm -f achistar-project || true'
                    docker.image('turrence/archistar-project').run('-d -it -p 3000:3000 --name achistar-project')
                }
            }
        }
    }
}
